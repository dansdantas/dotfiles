return {
	{
		"nvim-telescope/telescope.nvim",
		config = function() require("config.telescope") end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",

			-- Extensions
			"nvim-telescope/telescope-file-browser.nvim",
			"polirritmico/telescope-lazy-plugins.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
			{ "danielfalk/smart-open.nvim", dependencies = { "kkharji/sqlite.lua" } },

			-- Better fuzzy
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
			},
		},
	},
}
