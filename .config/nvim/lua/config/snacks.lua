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

require("custom.bench").setup({ picker = picker })
