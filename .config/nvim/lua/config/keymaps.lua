local map = vim.keymap
local utils = require("config.utils")

--------------------------------------------------------------------------------
-- No prefix
--------------------------------------------------------------------------------

map.set("", "Q", "<nop>", { remap = true }) -- disable keys

-- Disable arrow keys
map.set("", "<up>", "<nop>", { remap = true })
map.set("", "<down>", "<nop>", { remap = true })
map.set("", "<left>", "<nop>", { remap = true })
map.set("", "<right>", "<nop>", { remap = true })

-- movements
map.set("n", ";;", "$", { desc = "end of line" })
map.set("n", "E", "$", { desc = "end of line" })
map.set("n", "B", "^", { desc = "start of line" })

map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")

-- split
map.set("n", "<C-J>", "<C-W><C-J>", { desc = "move to left pane" })
map.set("n", "<C-K>", "<C-W><C-K>", { desc = "move to upper pane" })
map.set("n", "<C-L>", "<C-W><C-L>", { desc = "move to right pane" })
map.set("n", "<C-H>", "<C-W><C-H>", { desc = "move to lower pane" })

map.set("n", "J", "mzJ`z")
map.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected lines downwards" })
map.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected lines upwards" })

map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")

map.set("n", "U", "<C-r>", { desc = "Redo" })
map.set("n", "x", [["_x]], { desc = "use x without yanking" })

map.set("n", "z=", function()
	vim.ui.select(
		vim.fn.spellsuggest(vim.fn.expand("<cword>")),
		{},
		vim.schedule_wrap(function(selected)
			if selected then
				vim.cmd("normal! ciw" .. selected)
			end
		end)
	)
end, { desc = "Spelling suggestions" })

--------------------------------------------------------------------------------
-- Leader
--------------------------------------------------------------------------------

map.set("n", "<leader><leader>l", ":luafile %<CR>", { desc = "reload current lua file" })
map.set("n", "<leader><BS>", [[:%s/\s\+$//e<CR>]], { desc = "remove whitespaces" })
map.set("n", "<leader><cr>", ":so ~/.config/nvim/init.lua<cr>", { desc = "reload config" })
map.set("n", "<leader>;", ":bd!<cr>", { desc = "delete buffer" })

map.set("n", "<leader>bc", ":bd!<cr>", { desc = "close" })
map.set("n", "<leader>bd", ":bd|e#<cr>", { desc = "close all but current" })
map.set("n", "<leader>bD", ":%bd!<cr>", { desc = "close all" })

map.set("n", "<leader>n", ":cnext<cr>", { desc = "next on quickfix list" })
map.set("n", "<leader>r", ":cprevious<cr>", { desc = "previous on quick list" })
map.set("n", "<leader>N", ":lnext<cr>", { desc = "next on location list" })
map.set("n", "<leader>R", ":lprevious<cr>", { desc = "previous on location list" })

map.set("n", "<leader>o", ":FZF<cr>", { desc = "FZF" })

map.set("n", "<leader>sw", utils.search_current_word, { desc = "search current word" })
map.set("n", "<leader>so", function()
	---@diagnostic disable-next-line: undefined-field
	vim.opt.list = not vim.opt.list:get()
end, { desc = "toggle listchars display" })

-- save/quit actions
map.set("n", "<leader>w", function()
	vim.cmd.write({ bang = true })
end, { desc = "save file", silent = true })

map.set("n", "<leader>x", function()
	vim.cmd.xit({ bang = true })
end, { desc = "close file" })

map.set("n", "<leader>q", vim.cmd.quit, { desc = "exit file" })
map.set("n", "<leader>Q", vim.cmd.qall, { desc = "quit" })

-- clipboard
map.set("n", "<leader>Y", "y$", { desc = "yank till end of line" })
map.set("n", "<leader>p", '"+p', { desc = "paste from clipboard" })
map.set("n", "<leader>y", '"+y', { desc = "copy to clipboard" })
map.set("v", "<leader>y", '"+y', { desc = "copy line to clipboard" })

map.set("n", "<leader>z", utils.folding_toggle, { desc = "toggle folding" })

--------------------------------------------------------------------------------
-- ,
--------------------------------------------------------------------------------

map.set("n", ",cl", ':let @+=expand("%:p")<cr>', { desc = "copy full path to clipboard", remap = true })
map.set("n", ",cs", ':let @+=expand("%")<cr>', { desc = "copy relative path to clipboard", remap = true })
map.set("n", ",he", utils.help_on_current_word, { desc = "Help on current word" })
map.set("n", ",l", ":nohl<cr>", { desc = "clear highlight" })

-- testing
map.set("n", ",tn", ":TestNearest<cr>", { desc = "Test: nearest" })
map.set("n", ",tf", ":TestFile<cr>", { desc = "Test: current file" })
map.set("n", ",ts", ":TestSuite<cr>", { desc = "Test: suite" })
map.set("n", ",tl", ":TestLast<cr>", { desc = "Test: run last" })
map.set("n", ",tv", ":TestVisit<cr>", { desc = "Test: last visited" })
map.set("n", ",tw", ":TestLastOnlyFail<cr>", { desc = "Test: only failed" })

-- workspace
local workspace = require("config.workspace")
map.set("n", ",wa", workspace.add_dir, { desc = "Workspace: add dir" })
map.set("n", ",wr", workspace.remove_dir, { desc = "Workspace: remove dir" })
map.set("n", ",wf", workspace.find_files, { desc = "Workspace: find files" })
map.set("n", ",wg", workspace.grep_files, { desc = "Workspace: grep on files " })
map.set("n", ",wc", workspace.clean_dirs, { desc = "Workspace: clean dirs" })
map.set("n", ",wl", function()
	return P(workspace.list_dirs())
end, { desc = "Workspace: list dirs" })
