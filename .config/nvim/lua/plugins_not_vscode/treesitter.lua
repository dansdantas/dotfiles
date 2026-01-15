return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "master",
		config = function() require("config.treesitter") end,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "master" },
			{ "andymass/vim-matchup", opts = {} },
			"RRethy/nvim-treesitter-endwise",
			{ "abecodes/tabout.nvim", opts = { tabkey = "<A-t>" } },
			{ "Wansmer/treesj", opts = { use_default_keymaps = false, max_join_length = 240 } },
			{ "Wansmer/sibling-swap.nvim", opts = { use_default_keymaps = false } },
			{
				"chrisgrieser/nvim-various-textobjs",
				opts = {
					keymaps = {
						useDefaults = true,
						disabledDefaults = { "gc", "in", "an", "il", "al", "r" },
					},
				},
			},
		},
	},
}
