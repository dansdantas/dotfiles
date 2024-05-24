return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function() require("config.treesitter") end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-endwise",
			"nvim-treesitter/playground",
			{ "abecodes/tabout.nvim", opts = { tabkey = "<C-t>" } },
			{ "Wansmer/treesj", opts = { use_default_keymaps = false, max_join_length = 240 } },
			{ "Wansmer/sibling-swap.nvim", opts = { use_default_keymaps = false } },
			{
				"chrisgrieser/nvim-various-textobjs",
				opts = {
					useDefaultKeymaps = true,
					disabledKeymaps = { "gc", "in", "an", "il", "al", "r" },
				},
			},
		},
	},
}
