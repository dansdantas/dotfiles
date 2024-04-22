--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	-- Syntax
	{
		"ckolkey/ts-node-action",
		dependencies = { "nvim-treesitter" },
		opts = {},
		keys = {
			-- stylua: ignore start
			{ "<c-c>", function() require("ts-node-action").node_action() end, desc = "TS: node action" },
			-- stylua: ignore end
		},
	},

	{ "numToStr/Comment.nvim", opts = { ignore = "^$" } },

	-- Languages
	"mattn/emmet-vim",
	"andymass/vim-matchup",
	"milisims/nvim-luaref",
	--  'tpope/vim-rails'
	--  'vim-ruby/vim-ruby'

	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua", -- recommanded if need floating window support,
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = { lsp_inlay_hints = { enable = false } },
	},

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
