--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	{
		"yorickpeterse/nvim-pqf",
		event = "VeryLazy",
		opts = {
			show_multiple_lines = true,
			max_filename_length = 40,
		},
	},
}
