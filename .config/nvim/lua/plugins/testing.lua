--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	{
		"janko-m/vim-test",
		init = function()
			local g = vim.g

			-- Test
			g["test#strategy"] = "floaterm"
			g["test#preserve_screen"] = 1
			g["test#echo_command"] = 0
			g["test#neovim#term_position"] = "vert botright 50"
		end,

		dependencies = {
			{
				"voldikss/vim-floaterm",
				lazy = false,
				keys = {
					-- stylua: ignore start
					{ "<A-t>", function() vim.cmd("FloatermToggle") end, mode = { "n", "t" } },
					{ "<A-n>", function() vim.cmd("FloatermNext") end, mode = { "n", "t" } },
					{ "<A-p>", function() vim.cmd("FloatermPrev") end, mode = { "n", "t" } },
					{ "<A-e>", function() vim.cmd("FloatermNew --width=0.9 --height=0.9") end, mode = { "n", "t" } },
					-- stylua: ignore end
				},
			},
		},
	},

	{ "tpope/vim-dispatch", cmd = { "Dispatch", "Make", "Focus", "Start" } },
}
