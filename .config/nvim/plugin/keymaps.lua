local map = vim.keymap
local utils = require("custom.utils")

--------------------------------------------------------------------------------
-- No prefix
--------------------------------------------------------------------------------

map.set("", "Q", "<nop>", { remap = true }) -- disable keys
map.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" }) -- terminal quick exit

-- Disable arrow keys
map.set("", "<up>", "<nop>", { remap = true })
map.set("", "<down>", "<nop>", { remap = true })
map.set("", "<left>", "<nop>", { remap = true })
map.set("", "<right>", "<nop>", { remap = true })

-- movements
map.set("n", "E", "$", { desc = "end of line" })
map.set("n", "B", "^", { desc = "start of line" })

-- split
map.set("n", "<C-j>", "<C-W><C-J>", { desc = "move to left pane" })
map.set("n", "<C-k>", "<C-W><C-K>", { desc = "move to upper pane" })
map.set("n", "<C-l>", "<C-W><C-L>", { desc = "move to right pane" })
map.set("n", "<C-h>", "<C-W><C-H>", { desc = "move to lower pane" })

map.set("n", "<A-j>", "<C-W><C-J>", { desc = "move to left pane" })
map.set("n", "<A-k>", "<C-W><C-K>", { desc = "move to upper pane" })
map.set("n", "<A-l>", "<C-W><C-L>", { desc = "move to right pane" })
map.set("n", "<A-h>", "<C-W><C-H>", { desc = "move to lower pane" })

map.set("t", "<C-j>", "<C-\\><C-n><C-W><C-J>", { desc = "move to left pane" })
map.set("t", "<C-k>", "<C-\\><C-n><C-W><C-K>", { desc = "move to upper pane" })
map.set("t", "<C-l>", "<C-\\><C-n><C-W><C-L>", { desc = "move to right pane" })
map.set("t", "<C-h>", "<C-\\><C-n><C-W><C-H>", { desc = "move to lower pane" })

map.set({ "t", "i" }, "<A-j>", "<C-\\><C-n><C-W><C-J>", { desc = "move to left pane" })
map.set({ "t", "i" }, "<A-k>", "<C-\\><C-n><C-W><C-K>", { desc = "move to upper pane" })
map.set({ "t", "i" }, "<A-l>", "<C-\\><C-n><C-W><C-L>", { desc = "move to right pane" })
map.set({ "t", "i" }, "<A-h>", "<C-\\><C-n><C-W><C-H>", { desc = "move to lower pane" })

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

map.set("n", "<leader>ll", ":luafile %<CR>", { desc = "reload current lua file" })
map.set("n", "<leader><BS>", [[:%s/\s\+$//e<CR>]], { desc = "remove whitespaces" })
map.set("n", "<leader><cr>", ":so ~/.config/nvim/init.lua<cr>", { desc = "reload config" })
map.set("n", "<leader>;", ":bd!<cr>", { desc = "delete buffer" })

map.set("n", "<leader>bc", ":bd!<cr>", { desc = "close" })
map.set("n", "<leader>bd", ":bd|e#<cr>", { desc = "close all but current" })
map.set("n", "<leader>bD", ":%bd!<cr>", { desc = "close all" })

map.set("n", "<leader>N", vim.cmd.lnext, { desc = "next on location list" })
map.set("n", "<leader>R", vim.cmd.lprevious, { desc = "previous on location list" })

map.set("n", "<leader>sw", utils.search_current_word, { desc = "search current word" })
map.set("n", "<leader>so", function()
	---@diagnostic disable-next-line: undefined-field
	vim.opt_local.list = not vim.opt_local.list:get()
end, { desc = "toggle listchars display" })

-- save/quit actions
if vim.g.vscode then
	map.set(
		"n",
		"<leader>w",
		function() require("vscode").action("workbench.action.files.save") end,
		{ desc = "save file", silent = true }
	)
else
	map.set("n", "<leader>w", function() vim.cmd.write({ bang = true }) end, { desc = "save file", silent = true })
	map.set("n", "<leader>x", function() vim.cmd.xit({ bang = true }) end, { desc = "close file" })
	map.set("n", "<leader>q", vim.cmd.quit, { desc = "exit file" })
	map.set("n", "<leader>Q", vim.cmd.qall, { desc = "quit" })
end

map.set("n", "<leader>J", vim.cmd.tabprev, { desc = "prev tab" })
map.set("n", "<leader>K", vim.cmd.tabnext, { desc = "next tab" })

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
map.set("n", ",co", vim.cmd.copen, { desc = "open quickfix" })
map.set("n", ",cc", vim.cmd.cclose, { desc = "close quickfix" })
map.set("n", ",cn", vim.cmd.cnext, { desc = "next on quickfix list" })
map.set("n", ",cp", vim.cmd.cprevious, { desc = "previous on quick list" })
map.set("n", "]q", vim.cmd.cnext, { desc = "next on quickfix list" })
map.set("n", "[q", vim.cmd.cprevious, { desc = "previous on quick list" })
map.set("n", ",he", utils.help_on_current_word, { desc = "Help on current word" })
map.set("n", ",l", ":nohl<cr>", { desc = "clear highlight" })

-- testing
map.set("n", ",tn", ":TestNearest<cr>", { desc = "Test: nearest" })
map.set("n", ",tf", ":TestFile<cr>", { desc = "Test: current file" })
map.set("n", ",ts", ":TestSuite<cr>", { desc = "Test: suite" })
map.set("n", ",tl", ":TestLast<cr>", { desc = "Test: run last" })
map.set("n", ",tv", ":TestVisit<cr>", { desc = "Test: last visited" })
map.set("n", ",tw", ":TestLastOnlyFail<cr>", { desc = "Test: only failed" })

if not vim.g.vscode then
	-- workspace
	map.set("n", ",wa", require("custom.workspace").add_dir, { desc = "Workspace: add dir" })
	map.set("n", ",wr", require("custom.workspace").remove_dir, { desc = "Workspace: remove dir" })
	map.set("n", ",wf", require("custom.workspace").find_files, { desc = "Workspace: find files" })
	map.set("n", ",wg", require("custom.workspace").grep_files, { desc = "Workspace: grep on files " })
	map.set("n", ",wc", require("custom.workspace").clean_dirs, { desc = "Workspace: clean dirs" })
	map.set("n", ",wl", function() return P(require("custom.workspace").list_dirs()) end, { desc = "Workspace: dirs" })
end

--------------------------------------------------------------------------------
-- LSP
--------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-keymaps", { clear = true }),
	callback = function(args)
		local bufnr = args.buf

		-- Mappings.
		local nmap = function(keys, func, desc)
			if desc then
				desc = "LSP: " .. desc
			end

			vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
		end

		-- Jump to the definition of the word under your cursor.
		--  This is where a variable was first declared, or where a function is defined, etc.
		--  To jump back, press <C-T>.
		-- nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		nmap("gd", vim.lsp.buf.definition, "goto definition")

		-- WARN: This is not Goto Definition, this is Goto Declaration.
		--  For example, in C this would take you to the header
		nmap("gD", vim.lsp.buf.declaration, "goto declaration")

		-- Find references for the word under your cursor.
		nmap("gr", require("telescope.builtin").lsp_references, "goto references")

		-- Jump to the implementation of the word under your cursor.
		--  Useful when your language has ways of declaring types without an actual implementation.
		-- nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		nmap("gi", vim.lsp.buf.implementation, "goto implementation")

		-- Jump to the type of the word under your cursor.
		--  Useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		-- nmap("gy", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
		nmap("gy", vim.lsp.buf.type_definition, "type definition")

		-- Fuzzy find all the symbols in your current document.
		--  Symbols are things like variables, functions, types, etc.
		nmap(",ds", require("telescope.builtin").lsp_document_symbols, "document symbols")

		-- Fuzzy find all the symbols in your current workspace
		--  Similar to document symbols, except searches over your whole project.
		nmap(",ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "workspace symbols")

		-- Rename the variable under your cursor
		--  Most Language Servers support renaming across files, etc.
		nmap(",rn", vim.lsp.buf.rename, "rename")

		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		nmap(",ca", vim.lsp.buf.code_action, "code action")

		-- Opens a popup that displays documentation about the word under your cursor
		--  See `:help K` for why this keymap
		nmap("K", vim.lsp.buf.hover, "hover documentation")
		nmap(",k", vim.lsp.buf.signature_help, "signature documentation")

		vim.keymap.set(
			{ "i" },
			"<C-h>",
			vim.lsp.buf.signature_help,
			{ silent = true, noremap = true, desc = "LSP: toggle signature" }
		)

		-- Workspace
		-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
		-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
		-- nmap('<leader>wl', function()
		--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, '[W]orkspace [L]ist Folders')

		-- Diagnostics
		nmap("[d", vim.diagnostic.goto_prev, "previous diagnostic")
		nmap("]d", vim.diagnostic.goto_next, "next diagnostic")
		nmap(",e", vim.diagnostic.open_float, "open diagnostic float")
		nmap(",q", vim.diagnostic.setqflist, "move diagnostics to qlist")
	end,
})
