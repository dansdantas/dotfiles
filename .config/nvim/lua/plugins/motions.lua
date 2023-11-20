return {
	-- Commands
	{ "kylechui/nvim-surround", opts = {}, },

	"tpope/vim-repeat",
	"tpope/vim-abolish", -- Search and replace subvert pattern
	"alvan/vim-closetag",
	"karb94/neoscroll.nvim",

	-- Motion
	"wellle/targets.vim",

	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").set_default_keymaps()
		end,
	},

	{
		"aarondiel/spread.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	"szw/vim-maximizer",
}
