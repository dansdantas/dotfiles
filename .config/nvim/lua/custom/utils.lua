---@diagnostic disable: param-type-mismatch
local M = {}

function M.print(v)
	print(vim.inspect(v))
	return v
end

function M.reload(...)
	require("plenary.reload").reload_module(...)
	return require(...)
end

function M.table_copy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == "table" then
		copy = {}
		for orig_key, orig_value in pairs(orig) do
			copy[orig_key] = orig_value
		end
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

function M.table_merge(t1, t2)
	for k, v in pairs(t2) do
		if type(v) == "table" then
			if type(t1[k] or false) == "table" then
				M.table_merge(t1[k] or {}, t2[k] or {})
			else
				t1[k] = v
			end
		else
			t1[k] = v
		end
	end
	return t1
end

---runs :normal natively with bang
---@param cmdStr string
function M.normal(cmdStr) vim.cmd.normal({ cmdStr, bang = true }) end

function M.add_to_todo()
	local branch_name = vim.fn.system([[printf $(git rev-parse --abbrev-ref HEAD)]])
	vim.fn.execute("normal! i @todo " .. branch_name .. " -")
end

function M.search_dotfiles()
	require("telescope.builtin").find_files({
		prompt_title = "dotfiles",
		cwd = "$HOME/dotfiles",
	})
end

function M.folding_toggle()
	if vim.fn.foldlevel(".") == 0 then
		-- No fold exists at the current line,
		-- so create a fold based on indentation

		local l_min = vim.fn.line(".") -- current line number
		local l_max = vim.fn.line("$") --  last line number
		local i_min = vim.fn.indent(".") -- indentation of the current line
		local l = l_min + 1

		local isBlank = function(x) return not not tostring(x):find("^%s*$") end
		-- Search downward for the last line whose indentation > i_min
		while l <= l_max do
			-- if this line is not blank ...
			local line = vim.fn.getline(l)
			local line_length = vim.fn.strlen(line)

			if line_length > 0 and not isBlank(line) then
				if vim.fn.indent(l) <= i_min then
					-- we've gone too far
					l = l - 1 -- backtrack one line
					break
				end
			end

			l = l + 1
		end

		-- Clamp l to the last line
		if l > l_max then
			l = l_max
		end

		-- " Backtrack to the last non-blank line
		while l > l_min do
			local line = vim.fn.getline(l)
			local line_length = vim.fn.strlen(line)

			if line_length > 0 and not isBlank(l) then
				break
			end

			l = l - 1
		end

		-- "execute "normal i" . l_min . "," . l . " fold"   print debug info

		if l > l_min then
			-- Create the fold from l_min to l
			vim.fn.execute(l_min .. "," .. l .. " fold")
		end
	else
		-- Delete the fold on the current line
		vim.cmd([[normal zd]])
	end
end

function M.help_on_current_word() return vim.cmd("help " .. vim.fn.expand("<cword>")) end
function M.search_current_word() return vim.cmd("Rg " .. vim.fn.expand("<cword>") .. "<cr>") end

function M.list_snips()
	local ft_list = require("luasnip").available()[vim.o.filetype]
	local ft_snips = {}
	for _, item in pairs(ft_list) do
		ft_snips[item.trigger] = item.name
	end
	print(vim.inspect(ft_snips))
end

function M.git_difftastic_previewer(opts)
	local previewers = require("telescope.previewers")
	local from_entry = require("telescope.from_entry")
	local utils = require("telescope.utils")

	local git_command = utils.__git_command

	return previewers.new_termopen_previewer({
		-- title = "Git File Difftastic Preview",

		get_command = function(entry)
			local command = git_command({ "--no-pager", "dft" }, opts)

			if entry.status and (entry.status == "??" or entry.status == "A ") then
				local p = from_entry.path(entry, true, false)
				if p == nil or p == "" then
					return
				end
				table.insert(command, { "--no-index", "/dev/null" })
			else
				table.insert(command, { "HEAD", "--" })
			end

			return vim.iter({ command, entry.value }):flatten(math.huge):join(" ")
		end,

		scroll_fn = function(self, direction)
			if not self.state then
				return
			end

			local bufnr = self.state.termopen_bufnr
			-- 0x05 -> <C-e>; 0x19 -> <C-y>
			local input = direction > 0 and string.char(0x05) or string.char(0x19)
			local count = math.abs(direction)

			vim.api.nvim_win_call(vim.fn.bufwinid(bufnr), function() vim.cmd([[normal! ]] .. count .. input) end)
		end,
	})
end

return M
