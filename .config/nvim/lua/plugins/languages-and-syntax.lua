--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	-- Syntax
	"editorconfig/editorconfig-vim",
	{
		"numToStr/Comment.nvim",
		module = true,
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
}
