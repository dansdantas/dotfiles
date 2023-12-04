--# selene: allow(mixed_table) -- lazy.nvim uses them
local function config()
	-- plugins
	local wk = require("which-key")
	local bfl = require("bufferline")

	-- own stuff
	local workspace = require("config.workspace")
	local utils = require("config.utils")

	local map = vim.keymap

	-- disable keys
	map.set("", "Q", "<nop>", { remap = true })

	-- Disable arrow keys
	map.set("", "<up>", "<nop>", { remap = true })
	map.set("", "<down>", "<nop>", { remap = true })
	map.set("", "<left>", "<nop>", { remap = true })
	map.set("", "<right>", "<nop>", { remap = true })

	map.set("n", "J", "mzJ`z")
	map.set("n", "<C-d>", "<C-d>zz")
	map.set("n", "<C-u>", "<C-u>zz")
	map.set("n", "n", "nzzzv")
	map.set("n", "N", "Nzzzv")

	map.set({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<cr>")

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

	map.set("n", "U", "<C-r>", { desc = "Redo" })

	wk.setup({})

	-- Base mappings
	wk.register({
		x = { [["_x]], "use x without yanking" },

		["+"] = { "<C-a>", "increases number" },
		["-"] = { "<C-x>", "decreases number" },

		-- split
		["<C-J>"] = { "<C-W><C-J>", "move to left pane" },
		["<C-K>"] = { "<C-W><C-K>", "move to upper pane" },
		["<C-L>"] = { "<C-W><C-L>", "move to right pane" },
		["<C-H>"] = { "<C-W><C-H>", "move to lower pane" },

		-- movements
		[";;"] = { "$", "end of line" },
		["E"] = { "$", "end of line" },
		["B"] = { "^", "start of line" },
	})

	-- Leader mappings
	wk.register({
		["<leader>l"] = { ":luafile %<CR>", "reload current lua file" },

		b = {
			name = "buffer",
			c = { ":bd!<cr>", "close" },
			d = { ":bd|e#<cr>", "close all but current" },
			D = { ":%bd!<cr>", "close all" },
			f = { bfl.pick_buffer, "find" },
			p = { bfl.toggle_pin, "pin" },
		},

		-- quickfix and location list
		n = { ":cnext<cr>", "next on quickfix list" },
		r = { ":cprevious<cr>", "previous on quick list" },
		N = { ":lnext<cr>", "next on location list" },
		R = { ":lprevious<cr>", "previous on location list" },

		-- buffer movements
		j = {
			function()
				return bfl.cycle(-1)
			end,
			"prev buffer",
		},
		J = {
			function()
				return bfl.move(-1)
			end,
			"move buffer to prev",
		},
		k = {
			function()
				return bfl.cycle(1)
			end,
			"next buffer",
		},
		K = {
			function()
				return bfl.move(1)
			end,
			"move buffer to next",
		},

		o = { ":FZF<cr>", "FZF" },

		a = {
			g = { utils.search_current_word, "search current word" },
		},

		s = {
			o = {
				function()
					vim.opt.list = not vim.opt.list:get()
				end,
				"toggle listchars display",
			},
		},

		F = { ":NvimTreeToggle<cr>", "toggle nerdtree" },
		f = { ":NvimTreeFindFile<cr>", "find current file on nerdtree" },

		mt = { ":MaximizerToggle<cr>", "toggle maximize current buffer" },

		z = { utils.folding_toggle, "toggle folding" },

		-- clipboard
		p = { '"+p', "paste from clipboard" },
		y = { '"+y', "copy to clipboard" },
		Y = { "y$", "yank till end of line" },

		["<cr>"] = { ":so ~/.config/nvim/init.lua<cr>", "reload config" },

		-- handle save
		w = { ":silent w!<CR>", "save file" },
		x = { ":x!<CR>", "close file" },
		q = { ":q<cr>", "exit file" },
		Q = { ":qa<cr>", "quit" },

		[";"] = { ":bd!<cr>", "delete buffer" },

		["<BS>"] = { [[:%s/\s\+$//e<CR>]], "remove whitespaces" },
	}, { prefix = "<leader>" })

	-- , mappings
	wk.register({
		-- buffers
		b = { ":bd|e<cr>", "delete all buffers but current" },
		B = { ":bd!<cr>", "delete buffer" },

		he = { utils.help_on_current_word, "Help on current word" },
		l = { ":nohl<cr>", "clear highlight" },

		t = {
			n = { ":TestNearest<cr>", "test nearest" },
			f = { ":TestFile<cr>", "test current file" },
			s = { ":TestSuite<cr>", "test suite" },
			l = { ":TestLast<cr>", "run last test" },
			v = { ":TestVisit<cr>", "run last visited test" },
			w = { ":TestLastOnlyFail<cr>", "test only failed" },
		},

		w = {
			name = "workspace",
			a = { workspace.add_dir, "add dir" },
			r = { workspace.remove_dir, "remove dir" },
			f = { workspace.find_files, "find files" },
			g = { workspace.grep_files, "grep on files " },
			c = { workspace.clean_dirs, "clean dirs" },
			l = {
				function()
					return P(workspace.list_dirs())
				end,
				"list dirs",
			},
		},
	}, { prefix = "," })

	-- Visual mappings
	wk.register({
		[",aj"] = { ":AnyJumpVisual<cr>", "[J]ump to definition under visual cursor" },
		["<leader>y"] = { '"+y', "copy to clipboard" },
		J = { ":m '>+1<CR>gv=gv", "move selected lines downwards" },
		K = { ":m '<-2<CR>gv=gv", "move selected lines upwards" },
	}, { mode = "v" })

	-- remap true
	wk.register({
		[",cs"] = { ':let @+=expand("%")<cr>', "copy relative path to clipboard" },
		[",cl"] = { ':let @+=expand("%:p")<cr>', "copy full path to clipboard" },
	}, { noremap = false })
end

return {
	"folke/which-key.nvim",
	config = config,
}
