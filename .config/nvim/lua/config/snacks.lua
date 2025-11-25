-- Override icon function to give priority to do nvim-web-devicons
Snacks.util.icon = function(name, cat)
	local try = {
		function()
			if cat == "directory" then
				return " ", "Directory"
			end

			local Icons = require("nvim-web-devicons")

			if cat == "filetype" then
				return Icons.get_icon_by_filetype(name, { default = true })
			elseif cat == "file" then
				local ext = name:match("%.(%w+)$")
				return Icons.get_icon(name, ext, { default = true }) --[[@as string, string]]
			elseif cat == "extension" then
				return Icons.get_icon(nil, name, { default = true }) --[[@as string, string]]
			end

			return require("mini.icons").get(cat or "file", name)
		end,
	}
	for _, fn in ipairs(try) do
		local ret = { pcall(fn) }
		if ret[1] and ret[2] then
			return ret[2], ret[3]
		end
	end
	return " "
end

-- Keymaps
local set = vim.keymap.set
local picker = Snacks.picker

-- files
set("n", "<C-p>", function() picker.git_files({ layout = "ivy" }) end, { desc = "Snacks: project files" })
set("n", "<leader>o", function() picker.files({ hidden = true }) end, { desc = "Snacks: files" })
-- set("n", "<leader>tf", function() tlb.find_files({ previewer = false }) end, { desc = "Snacks: wo preview" })
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

-- Git
set("n", "<leader>gl", picker.git_log, { desc = "Git: log" })
set("n", "<leader>gL", picker.git_log_line, { desc = "Git: log line" })
set("n", "<leader>gs", picker.git_status, { desc = "Git: status" })
set("n", "<leader>gd", picker.git_diff, { desc = "Git: diff" })
set("n", ",gb", picker.git_branches, { desc = "Git: branches" })
-- set("n", ",gc", tlb.git_commits, { desc = "Git: commits" })
-- set("n", ",gC", tlb.git_bcommits, { desc = "Git: commits for current buffer" })
