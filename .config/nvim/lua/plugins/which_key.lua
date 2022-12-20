local telescope = require("telescope")
local tbuiltin = require("telescope.builtin")
local wk = require("which-key")
local gitsigns = require("gitsigns")
local bfl = require("bufferline")
local spread = require("spread")
local tree = require("nvim-tree.api").tree

local workspace = require("workspace")
local functions = require("functions")

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

vim.g.mapleader = " "
vim.g.maplocalleader = " "

wk.setup({})
wk.register({
	x = { [["_x]], "use x without yanking" },
	["<C-p>"] = { tbuiltin.git_files, "project files" },
	["<leader>"] = {
		["<leader>l"] = { ":luafile %<CR>", "reload current lua file" },
		t = {
			name = "Telescope",
			o = { tbuiltin.find_files, "files" },
			b = { tbuiltin.buffers, "buffers" },
			d = { functions.search_dotfiles, "dotfiles" },
			g = { tbuiltin.grep_string, "grep" },
			["?"] = { tbuiltin.oldfiles, "recent files" },
			e = { tbuiltin.current_buffer_fuzzy_find, "fuzzy find on buffer" },
			f = {
				function()
					return tbuiltin.find_files({ previewer = false })
				end,
				"files without preview",
			},
			r = { tbuiltin.live_grep, "live grep" },
		},

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

		g = {
			name = "Git",
			t = { require("neogit").open, "neogit" },
			c = { ":Git commit<cr>", "[C]ommit" },
			s = {
				function()
					tbuiltin.git_status({
						is_bare = vim.env.GIT_WORK_TREE,
					})
				end,
				"status",
			},
			a = { gitsigns.stage_hunk, "[A]dd hunk" },
			u = { gitsigns.undo_stage_hunk, "[U]nstage hunk" },
			A = { gitsigns.stage_buffer, "stage [A]ll buffer" },
			U = { gitsigns.reset_buffer_index, "[U]nstage all buffer" },
			p = { gitsigns.prev_hunk, "[P]revious hunk" },
			n = { gitsigns.next_hunk, "[N]ext hunk" },
			h = { gitsigns.preview_hunk, "preview [H]unk" },
			D = { gitsigns.diffthis, "[D]iff file" },
			b = {
				function()
					gitsigns.blame_line({ full = true })
				end,
				"blame line",
			},
		},

		v = {
			name = "Vim",
			c = { tbuiltin.commands, "commands" },
			h = { tbuiltin.help_tags, "help" },
		},

		o = { ":FZF<cr>", "FZF" },

		a = {
			a = { ":Ag<Space>", "search with ag" },
			k = { ":ALEPrevious<cr>", "previous error" },
			K = { ":ALEPreviousWrap<cr>", "previous wrap" },
			j = { ":ALENext<cr>", "next error" },
			J = { ":ALENextWrap<cr>", "next wrap" },
			l = { ":ALELint<cr>", "lint current buffer" },
			t = { ":ALEToggle<cr>", "toggle ale" },

			g = { functions.search_current_word, "search current word" },
		},

		s = {
			d = { tbuiltin.diagnostics, "search diagnostics" },
			s = { ":SSave<cr>", "save session" },
			l = { ":SLoad ", "load session" },
			o = {
				function()
					vim.opt.list = not vim.opt.list:get()
				end,
				"toggle listchars display",
			},
			f = {
				function()
					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					telescope.extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = telescope_buffer_dir(),
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						previewer = false,
						initial_mode = "normal",
						layout_config = { height = 40 },
					})
				end,
				"file browser",
			},

			p = { spread.out, "spread params" },
			c = { spread.combine, "combine params" },
		},

		F = { tree.toggle, "toggle nerdtree" },
		f = { ":NvimTreeFindFile<cr>", "find current file on nerdtree" },

		mt = { ":MaximizerToggle<cr>", "toggle maximize current buffer" },

		z = { functions.folding_toggle, "toggle folding" },

		-- clipboard
		p = { '"+p', "paste from clipboard" },
		y = { '"+y', "copy to clipboard" },
		Y = { "y$", "yank till end of line" },

		["<cr>"] = { ":so ~/.config/nvim/init.lua<cr>", "reload config" },

		-- handle save
		w = { ":w!<CR>", "save file" },
		x = { ":x!<CR>", "close file" },
		q = { ":q<cr>", "exit file" },
		Q = { ":qa<cr>", "quit" },

		[";"] = { ":bd!<cr>", "delete buffer" },

		["<BS>"] = { [[:%s/\s\+$//e<CR>]], "remove whitespaces" },
	},

	[","] = {
		a = {
			name = "AnyJump",
			j = { ":AnyJump<cr>", "jump to definition under cursore" },
			b = { ":AnyJumpBack<cr>", "open previous opened file (after jump)" },
			l = { ":AnyJumpLastResults<cr>", "open last closed search window again" },
		},

		-- buffers
		b = { ":bd|e<cr>", "delete all buffers but current" },
		B = { ":bd!<cr>", "delete buffer" },

		he = { functions.help_on_current_word, "Help on current word" },
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
	},

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

-- Visual mappings
wk.register({
	[",aj"] = { ":AnyJumpVisual<cr>", "jump to definition under visual cursor" },
	["<leader>y"] = { '"+y', "copy to clipboard" },
	J = { ":m '>+1<CR>gv=gv", "move selected lines downwards" },
	K = { ":m '<-2<CR>gv=gv", "move selected lines upwards" },
}, { mode = "v" })

-- remap true
wk.register({
	[",cs"] = { ':let @+=expand("%")<cr>', "copy relative path to clipboard" },
	[",cl"] = { ':let @+=expand("%:p")<cr>', "copy full path to clipboard" },
}, { noremap = false })
