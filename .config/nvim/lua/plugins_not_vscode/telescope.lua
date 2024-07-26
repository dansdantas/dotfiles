return {
	{
		"nvim-telescope/telescope.nvim",
		config = function() require("config.telescope") end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"polirritmico/telescope-lazy-plugins.nvim",
			{ "fdschmidt93/telescope-egrepify.nvim", dependencies = "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			},
		},
	},
}
