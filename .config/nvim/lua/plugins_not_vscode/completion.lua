return {
	{ -- Completion Engine + Sources
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		config = function() require("config.completion") end,
		dependencies = {
			-- sources
			"saadparwaiz1/cmp_luasnip", -- adapter for snippet engine
			{ "tzachar/cmp-fuzzy-buffer", dependencies = { "tzachar/fuzzy.nvim" } },
			"hrsh7th/cmp-nvim-lsp", -- LSP input
			"https://codeberg.org/FelipeLema/cmp-async-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",

			"lukas-reineke/cmp-rg",
			-- "tamago324/cmp-zsh", -- some shell completions
			-- "dmitmel/cmp-cmdline-history",

			"onsails/lspkind.nvim", -- format source type
			"lukas-reineke/cmp-under-comparator", -- sort underline completion items
			"windwp/nvim-autopairs", -- rules and opts defined in their own file

			{ -- snippet engine
				"L3MON4D3/LuaSnip",
				event = "InsertEnter",
				dependencies = {
					"honza/vim-snippets", -- more snippets
					"rafamadriz/friendly-snippets", -- vsode like snippets
				},
			},
		},
	},
}
