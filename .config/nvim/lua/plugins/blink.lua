return {
	"saghen/blink.cmp",
	build = "cargo build --release",
	config = function() require("config.blink") end,
	dependencies = {
		"moyiz/blink-emoji.nvim",
		"Kaiser-Yang/blink-cmp-dictionary",
		"folke/lazydev.nvim",

		-- Only necessary if using completions from cmp
		{ "saghen/blink.compat", opts = {} },

		"nvim-mini/mini.nvim",
		"onsails/lspkind.nvim", -- format source type

		"rafamadriz/friendly-snippets",
		{
			"L3MON4D3/LuaSnip",
			event = "InsertEnter",
			build = "make install_jsregexp",
			dependencies = {
				"honza/vim-snippets", -- more snippets
				"rafamadriz/friendly-snippets", -- vsode like snippets
			},
		},
	},
}
