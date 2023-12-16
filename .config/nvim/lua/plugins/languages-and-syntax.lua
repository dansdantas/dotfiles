--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	-- Syntax
	{
		"numToStr/Comment.nvim",
		opts = { ignore = "^$" },
	},

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

	"xiyaowong/virtcolumn.nvim",

	{
		"nat-418/boole.nvim",
		keys = {
			{ "+", "<C-a>" },
			{ "-", "<C-x>" },
		},
		opts = {
			mappings = {
				increment = "<C-a>",
				decrement = "<C-x>",
			},
			additions = {
				{ "true", "false" },
			},
		},
	},
}
