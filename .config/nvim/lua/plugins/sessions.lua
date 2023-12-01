--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	{
		"rmagatti/session-lens",
		dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		config = function()
			require("auto-session").setup({
				log_level = "info",
				auto_session_suppression_dirs = { "~/Projects" },
			})
			require("session-lens").setup({
				path_display = { "shorten" },
				theme_conf = { border = false },
			})
		end,
	},
}
