---@type snacks.Config
require("snacks").setup({
	bigfile = { enabled = true },
	notifier = { enabled = true },
	input = { enabled = true },
	terminal = { enabled = true },
	picker = {
		files = { hidden = true },
		previewers = { git = { native = false }, diff = { style = "terminal" } },
		win = {
			input = {
				keys = {
					["<Esc>"] = { "close", mode = { "n", "i" } },
					["<c-x>"] = { "edit_split", mode = { "i", "n" } },
					["<c-t>"] = { "edit_tab", mode = { "i", "n" } },
				},
			},
		},
	},
})

-- -- Override icon function to give priority to do nvim-web-devicons
local devicons = require("nvim-web-devicons")
local has_mini_icons, mini_icons = pcall(require, "mini.icons")

Snacks.util.icon = function(name, cat)
	if cat == "directory" then
		return " ", "Directory"
	end

	if cat == "filetype" then
		return devicons.get_icon_by_filetype(name, { default = true })
	elseif cat == "file" then
		local ext = name:match("%.(%w+)$")
		return devicons.get_icon(name, ext, { default = true })
	elseif cat == "extension" then
		return devicons.get_icon(nil, name, { default = true })
	end

	if has_mini_icons then
		return mini_icons.get(cat or "file", name)
	end
	return " "
end

-- Keymaps
local set = vim.keymap.set
local picker = Snacks.picker

-- files
set("n", "<C-p>", function() picker.git_files({ layout = "ivy" }) end, { desc = "Snacks: project files" })
set("n", "<leader>o", function() picker.files({ hidden = true }) end, { desc = "Snacks: files" })
set("n", "<leader>tf", function() picker.files({ hidden = true, layout = { preview = false }}) end, { desc = "Snacks: wo preview" })
set("n", "<leader>tn", function() picker.files({ cwd = vim.fn.stdpath("config"), prompt_title = "Neovim" }) end)
set("n", "<leader>td", function() picker.files({ cwd = vim.env.HOME .. "/dotfiles", hidden = true }) end)

set(
	"n",
	"<leader><leader>",
	function()
		picker.buffers({
			win = {
				input = {
					keys = {
						["<c-x>"] = { "edit_split", mode = { "i", "n" } },
					},
				},
			},
		})
	end,
	{ desc = "Snacks: buffers" }
)
set("n", "<leader>/", function() picker.lines({ layout = "default" }) end, { desc = "Snacks: fuzzy buffer" })

set("n", "<leader>t?", picker.recent, { desc = "Snacks: recent files" })
set("n", "<leader>tq", picker.qflist, { desc = "Snacks: quickfix entries" })
set("n", "<leader>tr", picker.resume, { desc = "Snacks: resume" })

-- Grep
set("n", "<leader>tw", picker.grep_word, { desc = "Snacks: find word" })
-- set("n", "<leader>tG", extensions.live_grep_args.live_grep_args, { desc = "Snacks: grep with args" })
set("n", "<leader>tg", function() picker.grep({ hidden = true }) end, { desc = "Snacks: grep" })
set("n", "<leader>sn", function() picker.grep({ cwd = vim.fn.stdpath("config"), prompt_title = "Neovim" }) end)
set("n", "<leader>sf", picker.grep_buffers, { desc = "Snacks: grep on open files" })

set(
	"n",
	"<leader>ts",
	function() picker.grep_word({ search = [[TODO:|todo!\(.*\)]], hidden = true }) end,
	{ desc = "Snacks: grep todos" }
)

-- extensions and helpers
set("n", "<leader>tc", picker.colorschemes, { desc = "Snacks: colors" })
set("n", "<leader>tl", picker.lazy, { desc = "Snacks: lazy plugins" })
set("n", "<leader>te", function() picker.smart({ hidden = true }) end, { desc = "Snacks: smart open" })

-- set(
-- 	"n",
-- 	"<leader>tb",
-- 	function()
-- 		extensions.file_browser.file_browser({
-- 			path = "%:p:h",
-- 			hidden = true,
-- 			grouped = true,
-- 		})
-- 	end,
-- 	{ desc = "Snacks: file browser" }
-- )

-- -- Vim
set("n", "<leader>vC", picker.command_history, { desc = "Vim: command history" })
set("n", "<leader>c", picker.command_history, { desc = "Vim: command history" })
set("n", "<leader>vc", picker.commands, { desc = "Vim: commands" })
set("n", "<leader>vh", picker.help, { desc = "Vim: help" })
set("n", "<leader>vd", picker.diagnostics, { desc = "Vim: diagnostics" })
set("n", "<leader>vD", picker.diagnostics_buffer, { desc = "Vim: diagnostics on buffer" })
set("n", "<leader>vk", picker.keymaps, { desc = "Vim: keymaps" })
-- set("n", "<leader>vo", tlb.vim_options, { desc = "Vim: options" })
set("n", "<leader>va", picker.autocmds, { desc = "Vim: autocommands" })

local snacks_files = {
	"snacks_picker_input",
	"snacks_picker_list",
	"snacks_picker_preview",
	"snacks_layout_box",
	"snacks_win_backdrop",
}

do
	local disabled = vim.g.matchup_treesitter_disabled or {}
	local seen = {}
	for _, ft in ipairs(disabled) do
		seen[ft] = true
	end
	for _, ft in ipairs(snacks_files) do
		if not seen[ft] then
			disabled[#disabled + 1] = ft
		end
	end
	vim.g.matchup_treesitter_disabled = disabled
end

local snacks_picker_perf = vim.api.nvim_create_augroup("snacks_picker_perf", { clear = true })

local function is_snacks_preview_buf(buf)
	if vim.bo[buf].filetype == "snacks_picker_preview" or vim.b[buf].snacks_previewed then
		return true
	end
	for _, win in ipairs(vim.fn.win_findbuf(buf)) do
		if vim.w[win].snacks_picker_preview then
			return true
		end
	end
	return false
end

local function should_skip_matchup(buf)
	if vim.b[buf].snacks_picker_loaded then
		return true
	end
	if is_snacks_preview_buf(buf) then
		return true
	end
	for _, ft in ipairs(snacks_files) do
		if vim.bo[buf].filetype == ft then
			return true
		end
	end
	return false
end

local function disable_matchup_for_buf(buf)
	vim.b[buf].matchup_matchparen_enabled = 0
	vim.b[buf].matchup_matchparen_fallback = 0
	vim.b[buf].matchup_delim_enabled = 0
	vim.b[buf].matchup_active_engines = {}
end

vim.api.nvim_create_autocmd("FileType", {
	group = snacks_picker_perf,
	pattern = snacks_files,
	callback = function(args)
		vim.treesitter.stop(args.buf)
		disable_matchup_for_buf(args.buf)
		vim.bo[args.buf].syntax = ""
		vim.bo[args.buf].indentexpr = ""
		vim.bo[args.buf].omnifunc = ""
		vim.bo[args.buf].includeexpr = ""
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "WinEnter" }, {
	group = snacks_picker_perf,
	callback = function(args)
		if is_snacks_preview_buf(args.buf) then
			disable_matchup_for_buf(args.buf)
		end
	end,
})

local function setup_matchup_guards()
	if vim.fn.exists("*matchup#loader#init_buffer") ~= 1 then
		return
	end

	local group = vim.api.nvim_create_augroup("matchup_filetype", { clear = false })
	vim.api.nvim_clear_autocmds({ group = group, event = { "FileType" } })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "*",
		callback = function(args)
			if should_skip_matchup(args.buf) then
				disable_matchup_for_buf(args.buf)
				return
			end
			vim.fn["matchup#loader#init_buffer"]()
		end,
	})

	vim.api.nvim_clear_autocmds({ group = group, event = { "BufWinEnter", "CmdWinEnter" } })
	if vim.g.matchup_delim_start_plaintext then
		vim.api.nvim_create_autocmd({ "BufWinEnter", "CmdWinEnter" }, {
			group = group,
			pattern = "*",
			callback = function(args)
				if should_skip_matchup(args.buf) then
					disable_matchup_for_buf(args.buf)
					return
				end
				vim.fn["matchup#loader#bufwinenter"]()
			end,
		})
	end
end

vim.schedule(setup_matchup_guards)

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

vim.api.nvim_create_user_command("SnacksBench", function(opts)
	local iterations = tonumber(opts.args) or 15
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
		local output = table.concat(lines, "\n")
		vim.notify(output)
		write_bench_log(bench_log, lines)
		vim.g.snacks_bench_done = true
	end)
end, { nargs = "?" })

vim.api.nvim_create_user_command("SnacksBenchTyping", function(opts)
	local iterations = tonumber(opts.args) or 10
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

		local output = table.concat(lines, "\n")
		vim.notify(output)
		write_bench_log(typing_log, lines)
		vim.g.snacks_bench_typing_done = true
	end)
end, { nargs = "?" })

vim.api.nvim_create_user_command("SnacksBenchReport", function()
	local lines = { "SnacksBenchReport" }

	if vim.fn.filereadable(bench_log) == 1 then
		local current = parse_open_bench(vim.fn.readfile(bench_log))
		local previous = vim.fn.filereadable(bench_log .. ".prev") == 1 and parse_open_bench(vim.fn.readfile(bench_log .. ".prev"))
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
			vim.fn.filereadable(typing_log .. ".prev") == 1 and parse_typing_bench(vim.fn.readfile(typing_log .. ".prev")) or {}
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
