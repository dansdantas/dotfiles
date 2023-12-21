--# selene: allow(mixed_table) -- lazy.nvim uses them
local function config()
	-- plugins
	local wk = require("which-key")

	-- own stuff
	local utils = require("config.utils")

	wk.setup({})

	-- Base mappings
	wk.register({
		x = { [["_x]], "use x without yanking" },

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
		},

		-- quickfix and location list
		n = { ":cnext<cr>", "next on quickfix list" },
		r = { ":cprevious<cr>", "previous on quick list" },
		N = { ":lnext<cr>", "next on location list" },
		R = { ":lprevious<cr>", "previous on location list" },

		o = { ":FZF<cr>", "FZF" },

		s = {
			w = { utils.search_current_word, "search current word" },
			o = {
				function()
					---@diagnostic disable-next-line: undefined-field
					vim.opt.list = not vim.opt.list:get()
				end,
				"toggle listchars display",
			},
		},

		F = { ":NvimTreeToggle<cr>", "toggle nerdtree" },
		f = { ":NvimTreeFindFile<cr>", "find current file on nerdtree" },

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

	-- Only for declaration purposes
	wk.register({
		t = { name = "testing" },
		w = { name = "workspace" },
	}, { prefix = "," })
end

return {
	"folke/which-key.nvim",
	config = config,
}
