local M = {}

local function stats(samples)
	local sorted = vim.deepcopy(samples)
	table.sort(sorted)
	local total = 0
	for _, value in ipairs(sorted) do
		total = total + value
	end
	local n = #sorted
	local function percentile(p)
		if n == 0 then
			return 0
		end
		local idx = math.max(1, math.ceil((p / 100) * n))
		return sorted[idx]
	end
	return {
		min = sorted[1] or 0,
		max = sorted[n] or 0,
		avg = n > 0 and (total / n) or 0,
		p95 = percentile(95),
	}
end

local function parse_open_bench(lines)
	local data = {}
	for _, line in ipairs(lines) do
		local name, create_avg, create_p95, create_max, show_avg, show_p95, show_max = line:match(
			"^- ([%w_]+) create avg ([%d%.]+)ms p95 ([%d%.]+)ms max ([%d%.]+)ms | show avg ([%d%.]+)ms p95 ([%d%.]+)ms max ([%d%.]+)ms$"
		)
		if name then
			data[name] = {
				create_avg = tonumber(create_avg),
				create_p95 = tonumber(create_p95),
				create_max = tonumber(create_max),
				show_avg = tonumber(show_avg),
				show_p95 = tonumber(show_p95),
				show_max = tonumber(show_max),
			}
		end
	end
	return data
end

local function parse_typing_bench(lines)
	local data = {}
	for _, line in ipairs(lines) do
		local name, avg, p95, max, slowest, slowest_avg = line:match(
			"^- ([%w_]+) type avg ([%d%.]+)ms p95 ([%d%.]+)ms max ([%d%.]+)ms | slowest pattern '([^']+)' avg ([%d%.]+)ms$"
		)
		if name then
			data[name] = {
				avg = tonumber(avg),
				p95 = tonumber(p95),
				max = tonumber(max),
				slowest = slowest,
				slowest_avg = tonumber(slowest_avg),
			}
		end
	end
	return data
end

local function fmt_delta(current, previous)
	if not previous then
		return "(new)"
	end
	local delta = current - previous
	return ("(%+.2fms)"):format(delta)
end

local function create_or_replace_command(name, cb, opts)
	pcall(vim.api.nvim_del_user_command, name)
	vim.api.nvim_create_user_command(name, cb, opts or {})
end

function M.setup(opts)
	local picker = assert(opts and opts.picker, "custom.bench.setup requires opts.picker")
	local state_dir = vim.fn.stdpath("state")
	local bench_log = state_dir .. "/snacks-bench.log"
	local typing_log = state_dir .. "/snacks-bench-typing.log"

	local function write_bench_log(path, lines)
		local prev = path .. ".prev"
		if vim.fn.filereadable(path) == 1 then
			vim.fn.writefile(vim.fn.readfile(path), prev)
		end
		vim.fn.writefile(lines, path)
	end

	create_or_replace_command("SnacksBench", function(command_opts)
		local iterations = tonumber(command_opts.args) or 15
		local cases = {
			{
				name = "files",
				run = function(hooks)
					return picker.files(vim.tbl_extend("force", { hidden = true }, hooks))
				end,
			},
			{
				name = "files_no_preview",
				run = function(hooks)
					return picker.files(vim.tbl_extend("force", { hidden = true, layout = { preview = false } }, hooks))
				end,
			},
			{
				name = "git_files_ivy",
				run = function(hooks)
					return picker.git_files(vim.tbl_extend("force", { layout = "ivy" }, hooks))
				end,
			},
		}

		local results = {}

		local function run_case(case_index, on_done)
			local case = cases[case_index]
			if not case then
				on_done()
				return
			end

			local create_samples = {}
			local show_samples = {}

			local function run_once(i)
				if i > iterations then
					results[case.name] = {
						create = stats(create_samples),
						show = stats(show_samples),
					}
					run_case(case_index + 1, on_done)
					return
				end

				for _, active in ipairs(Snacks.picker.get({ tab = false })) do
					if not active.closed then
						active:close()
					end
				end

				local started = vim.uv.hrtime()
				local created_ms = 0

				local p = case.run({
					on_show = function(open_picker)
						show_samples[#show_samples + 1] = (vim.uv.hrtime() - started) / 1e6
						vim.defer_fn(function()
							if not open_picker.closed then
								open_picker:close()
							end
							run_once(i + 1)
						end, 20)
					end,
				})

				created_ms = (vim.uv.hrtime() - started) / 1e6
				if p then
					create_samples[#create_samples + 1] = created_ms
				else
					create_samples[#create_samples + 1] = created_ms
					show_samples[#show_samples + 1] = created_ms
					vim.defer_fn(function() run_once(i + 1) end, 20)
				end
			end

			run_once(1)
		end

		run_case(1, function()
			local lines = {
				("SnacksBench (%d runs)"):format(iterations),
			}
			for _, case in ipairs(cases) do
				local data = results[case.name]
				lines[#lines + 1] = (
					"- %s create avg %.2fms p95 %.2fms max %.2fms | show avg %.2fms p95 %.2fms max %.2fms"
				):format(
					case.name,
					data.create.avg,
					data.create.p95,
					data.create.max,
					data.show.avg,
					data.show.p95,
					data.show.max
				)
			end
			vim.notify(table.concat(lines, "\n"))
			write_bench_log(bench_log, lines)
			vim.g.snacks_bench_done = true
		end)
	end, { nargs = "?" })

	create_or_replace_command("SnacksBenchTyping", function(command_opts)
		local iterations = tonumber(command_opts.args) or 10
		local patterns = { "s", "sn", "sna", "snac", "snack", "snacks", "lua", "picker" }
		local cases = {
			{
				name = "files",
				run = function(hooks)
					return picker.files(vim.tbl_extend("force", { hidden = true }, hooks))
				end,
			},
			{
				name = "files_no_preview",
				run = function(hooks)
					return picker.files(vim.tbl_extend("force", { hidden = true, layout = { preview = false } }, hooks))
				end,
			},
		}

		local results = {}

		local function run_case(case_index, on_done)
			local case = cases[case_index]
			if not case then
				on_done()
				return
			end

			local all_samples = {}
			local per_pattern = {}
			for _, pattern in ipairs(patterns) do
				per_pattern[pattern] = {}
			end

			local function run_once(i)
				if i > iterations then
					results[case.name] = {
						all = stats(all_samples),
						patterns = per_pattern,
					}
					run_case(case_index + 1, on_done)
					return
				end

				for _, active in ipairs(Snacks.picker.get({ tab = false })) do
					if not active.closed then
						active:close()
					end
				end

				local p = case.run({
					on_show = function(open_picker)
						local function run_pattern(pattern_index)
							local pattern = patterns[pattern_index]
							if not pattern then
								vim.defer_fn(function()
									if not open_picker.closed then
										open_picker:close()
									end
									run_once(i + 1)
								end, 20)
								return
							end

							local started = vim.uv.hrtime()
							open_picker.input:set(pattern)
							open_picker:find({
								refresh = false,
								on_done = function()
									local took = (vim.uv.hrtime() - started) / 1e6
									all_samples[#all_samples + 1] = took
									per_pattern[pattern][#per_pattern[pattern] + 1] = took
									run_pattern(pattern_index + 1)
								end,
							})
						end

						vim.defer_fn(function() run_pattern(1) end, 20)
					end,
				})

				if not p then
					vim.defer_fn(function() run_once(i + 1) end, 20)
				end
			end

			run_once(1)
		end

		run_case(1, function()
			local lines = {
				("SnacksBenchTyping (%d runs x %d patterns)"):format(iterations, #patterns),
			}

			for _, case in ipairs(cases) do
				local data = results[case.name]
				local worst_pattern = ""
				local worst_avg = -1
				for _, pattern in ipairs(patterns) do
					local s = stats(data.patterns[pattern])
					if s.avg > worst_avg then
						worst_avg = s.avg
						worst_pattern = pattern
					end
				end
				lines[#lines + 1] = (
					"- %s type avg %.2fms p95 %.2fms max %.2fms | slowest pattern '%s' avg %.2fms"
				):format(case.name, data.all.avg, data.all.p95, data.all.max, worst_pattern, worst_avg)
			end

			vim.notify(table.concat(lines, "\n"))
			write_bench_log(typing_log, lines)
			vim.g.snacks_bench_typing_done = true
		end)
	end, { nargs = "?" })

	create_or_replace_command("SnacksBenchReport", function()
		local lines = { "SnacksBenchReport" }

		if vim.fn.filereadable(bench_log) == 1 then
			local current = parse_open_bench(vim.fn.readfile(bench_log))
			local previous =
				vim.fn.filereadable(bench_log .. ".prev") == 1 and parse_open_bench(vim.fn.readfile(bench_log .. ".prev"))
				or {}
			lines[#lines + 1] = "- Open/Show"
			for _, name in ipairs({ "files", "files_no_preview", "git_files_ivy" }) do
				if current[name] then
					lines[#lines + 1] = (
						"  %s show avg %.2fms %s | p95 %.2fms %s"
					):format(
						name,
						current[name].show_avg,
						fmt_delta(current[name].show_avg, previous[name] and previous[name].show_avg or nil),
						current[name].show_p95,
						fmt_delta(current[name].show_p95, previous[name] and previous[name].show_p95 or nil)
					)
				end
			end
		end

		if vim.fn.filereadable(typing_log) == 1 then
			local current = parse_typing_bench(vim.fn.readfile(typing_log))
			local previous =
				vim.fn.filereadable(typing_log .. ".prev") == 1 and parse_typing_bench(vim.fn.readfile(typing_log .. ".prev"))
				or {}
			lines[#lines + 1] = "- Typing"
			for _, name in ipairs({ "files", "files_no_preview" }) do
				if current[name] then
					lines[#lines + 1] = (
						"  %s avg %.2fms %s | p95 %.2fms %s | slowest '%s' %.2fms"
					):format(
						name,
						current[name].avg,
						fmt_delta(current[name].avg, previous[name] and previous[name].avg or nil),
						current[name].p95,
						fmt_delta(current[name].p95, previous[name] and previous[name].p95 or nil),
						current[name].slowest,
						current[name].slowest_avg
					)
				end
			end
		end

		local output = table.concat(lines, "\n")
		vim.notify(output)
		vim.g.snacks_bench_report = output
	end, {})
end

return M
