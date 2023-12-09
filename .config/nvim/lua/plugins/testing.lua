--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	{
		"janko-m/vim-test",
		dependencies = { "voldikss/vim-floaterm" },
		init = function()
			local g = vim.g

			-- Test
			g["test#strategy"] = "floaterm"
			g["test#preserve_screen"] = 1
			g["test#echo_command"] = 0
			g["test#neovim#term_position"] = "vert botright 50"
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		opts = {
			direction = "float",
			autochdir = true,
		},
		keys = {
			{ "<A-d>", function() require("toggleterm").toggle() end, mode = { "n", "t" } },
		},
	},

	{ "tpope/vim-dispatch", cmd = { "Dispatch", "Make", "Focus", "Start" } },
}
