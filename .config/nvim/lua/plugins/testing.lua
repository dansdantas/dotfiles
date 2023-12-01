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
	},
	"benmills/vimux",
	"voldikss/vim-floaterm",

	{ "tpope/vim-dispatch", cmd = { "Dispatch", "Make", "Focus", "Start" } },
}
