return {
	-- Commands
	{ "kylechui/nvim-surround", opts = {} },

	"tpope/vim-repeat",
	"tpope/vim-abolish", -- Search and replace subvert pattern
	"alvan/vim-closetag",
	"karb94/neoscroll.nvim",

	-- Search
	"markonm/traces.vim",
	{
		"kevinhwang91/nvim-hlslens",
		module = true,
		config = function()
			require("hlslens").setup({
				calm_down = true,
			})
		end,
	},

	-- Sessions
	{
		"rmagatti/session-lens",
		dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		module = true,
		config = function()
			require("auto-session").setup({
				log_level = "info",
				auto_session_suppression_dirs = { "~/Projects" },
			})
			require("session-lens").setup({
				path_display = { "shorten" },
				theme_conf = { border = false },
			})
		end,
	},

	-- Manipulate files
	"tpope/vim-eunuch", -- UNIX commands
	{ "stevearc/oil.nvim", config = true },
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = true,
		module = true,
		cmd = { "NvimTreeFindFile", "NvimTreeToggle" },
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					adaptive_size = true,
				},
				renderer = {
					group_empty = true,
				},
			})
		end,
	},

	{
		"aarondiel/spread.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- Motion
	"wellle/targets.vim",
	{
		"ggandor/leap.nvim",
		module = true,
		config = function()
			require("leap").set_default_keymaps()
		end,
	},

	-- Layout && Status
	{ "mhinz/vim-startify", cmd = { "SSave", "SLoad", "Startify" } },

	-- {
	-- 	"sunjon/shade.nvim",
	-- 	config = function()
	-- 		require("shade").setup({
	-- 			overlay_opacity = 50,
	-- 			opacity_step = 1,
	-- 			keys = {
	-- 				brightness_up = "<C-Up>",
	-- 				brightness_down = "<C-Down>",
	-- 				toggle = "<Leader>s",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"winston0410/range-highlight.nvim",
		dependencies = {
			"winston0410/cmd-parser.nvim",
		},
		config = true,
	},
	-- "folke/twilight.nvim",

	-- Syntax
	"editorconfig/editorconfig-vim",
	{
		"numToStr/Comment.nvim",
		module = true,
		opts = { ignore = "^$" },
	},

	{
		"windwp/nvim-autopairs",
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
		},
	},

	-- Color
	"ellisonleao/gruvbox.nvim",
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		module = true,
		config = function()
			vim.g.onedark_terminal_italics = 1
			vim.g.onedark_hide_endofbuffer = 1
			vim.o.termguicolors = true -- Enable true color
			vim.o.background = "dark" -- Force dark background
			local onedark = require("onedark")
			onedark.setup({
				style = "darker",
				code_style = {
					comments = "italic",
					keywords = "none",
					functions = "none",
					strings = "none",
					variables = "none",
				},
			})
			onedark.load()
		end,
	},

	"szw/vim-maximizer",

	-- Languages
	"mattn/emmet-vim",
	"andymass/vim-matchup",

	--  'tpope/vim-rails'
	--  'vim-ruby/vim-ruby'

	"milisims/nvim-luaref",

	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua", -- recommanded if need floating window support,
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
}
