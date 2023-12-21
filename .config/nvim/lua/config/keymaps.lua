local map = vim.keymap
local utils = require("config.utils")

--------------------------------------------------------------------------------
-- No prefix
map.set("", "Q", "<nop>", { remap = true }) -- disable keys

-- Disable arrow keys
map.set("", "<up>", "<nop>", { remap = true })
map.set("", "<down>", "<nop>", { remap = true })
map.set("", "<left>", "<nop>", { remap = true })
map.set("", "<right>", "<nop>", { remap = true })

map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")

map.set("n", "J", "mzJ`z")
map.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected lines downwards" })
map.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected lines upwards" })

map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")

map.set("n", "U", "<C-r>", { desc = "Redo" })

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
map.set("v", "<leader>y", '"+y', { desc = "copy line to clipboard" })

--------------------------------------------------------------------------------
-- ,
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
