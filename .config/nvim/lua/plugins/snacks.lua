return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- not strictly required, but recommended
		config = function() require("config.snacks") end,
	},
}
