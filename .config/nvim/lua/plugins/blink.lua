---@module 'lazy'
---@type LazySpec
return {
	"saghen/blink.cmp",
	build = "cargo build --release",
	config = function() require("config.blink") end,
	dependencies = {
		"moyiz/blink-emoji.nvim",
		"folke/lazydev.nvim",
		"mikavilpas/blink-ripgrep.nvim",

		-- Only necessary if using completions from cmp
		{ "saghen/blink.compat", opts = {} },

		"nvim-mini/mini.nvim",
		"onsails/lspkind.nvim", -- format source type

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
