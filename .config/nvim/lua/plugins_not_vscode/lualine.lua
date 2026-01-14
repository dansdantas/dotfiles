return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim" },
		config = function() require("config.lualine") end,
	},
}
