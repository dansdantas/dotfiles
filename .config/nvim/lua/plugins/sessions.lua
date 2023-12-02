--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	{
		"rmagatti/session-lens",
		opts = {
			path_display = { "shorten" },
			theme_conf = { border = false },
		},
		dependencies = {
			{
				"rmagatti/auto-session",
				opts = {
					log_level = "error",
					auto_session_suppression_dirs = { "~/Projects" },
				},
			},
			"nvim-telescope/telescope.nvim",
		},
	},
}
