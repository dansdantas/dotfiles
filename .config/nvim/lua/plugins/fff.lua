return {
	{
		"dmtrKovalenko/fff.nvim",
		build = "cargo build --release",
		opts = {
			keymaps = {
				preview_scroll_up = { "<C-u>", "<C-b>" },
				preview_scroll_down = { "<C-d>", "<C-f>" },
			},
		},
		keys = {
			{ "ff", function() require("fff").find_files() end, desc = "Open file picker" },
			{ "fg", function() require("fff").find_in_git_root() end, desc = "Open file picker" },
		},
	},
}
