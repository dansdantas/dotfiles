return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/projects" },
		session_lens = {
			picker = "snacks",
			picker_opts = {
				path_display = { "shorten" },
				border = false,
			},
		},
	},
}
