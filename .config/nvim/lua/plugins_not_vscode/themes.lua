return {
	-- Light themes
	{ "EdenEast/nightfox.nvim", name = "dawnfox" },
	"sainnhe/everforest",

	-- Dark themes
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = false,
		config = function() vim.cmd.colorscheme("tokyonight") end,
	},

	"AlexvZyl/nordic.nvim",
	"eldritch-theme/eldritch.nvim",
	"ray-x/aurora",
	"luisiacc/gruvbox-baby",
	"tiagovla/tokyodark.nvim",
	"navarasu/onedark.nvim",
	"ray-x/starry.nvim",
	"xero/miasma.nvim",
	"cpea2506/one_monokai.nvim",
	"shaunsingh/moonlight.nvim",
}
