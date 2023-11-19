local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
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

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		module = true,
		-- build = function()
		-- 	pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		-- end,
		-- build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-endwise",
			"nvim-treesitter/playground",
		},
	},

	{
		"aarondiel/spread.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
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
	"folke/which-key.nvim",

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- ful status updates for LSP
			{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
		},
	},

	{
		"nvimdev/lspsaga.nvim",
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- Dap
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-telescope/telescope-dap.nvim",
			"leoluz/nvim-dap-go",
		},
	},

	-- Linters
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"jayp0521/mason-null-ls.nvim",
		},
	},

	-- Comp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"onsails/lspkind.nvim",
			"amarakon/nvim-cmp-buffer-lines",
			"lukas-reineke/cmp-under-comparator",
		},
	},

	-- Snippets
	"honza/vim-snippets",
	{ "saadparwaiz1/cmp_luasnip", dependencies = { { "L3MON4D3/LuaSnip" } } },

	-- Layout && Status
	{ "mhinz/vim-startify", cmd = { "SSave", "SLoad", "Startify" } },

	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				indicator = {
					style = "none",
				},
				tab_size = 10,
				diagnostics = "nvim_lsp",
				show_buffer_close_icons = false,
				separator_style = { "", "" },
			},
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

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

	-- Git
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"tommcdo/vim-fubitive", -- Bitbucket support on fugitive GBrowse

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		"TimUntersberger/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		module = true,
		config = function()
			require("neogit").setup({
				integrations = {
					diffview = true,
				},
			})
			require("diffview").setup({
				hooks = {
					diff_buf_read = function()
						-- Change local options in diff buffers
						vim.opt_local.wrap = false
						vim.opt_local.list = false
						vim.opt_local.colorcolumn = { 80 }
					end,
				},
			})
		end,
	},

	-- Testing
	"janko-m/vim-test",
	"benmills/vimux",
	"voldikss/vim-floaterm",

	{ "tpope/vim-dispatch", cmd = { "Dispatch", "Make", "Focus", "Start" } },
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
})
