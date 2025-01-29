return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	ft = { "org" },
	opts = {
		org_agenda_files = vim.fn.stdpath("data") .. "/orgfiles/**/*",
		org_default_notes_file = vim.fn.stdpath("data") .. "/orgfiles/refile.org",
		org_todo_keywords = { "TODO", "WAITING", "|", "DONE", "DELEGATED" },
		mappings = { prefix = ",o" },
	},
	keys = {
		{
			",of",
			function() Snacks.picker.files({ cwd = vim.fn.stdpath("data") .. "/orgfiles/" }) end,
			desc = "Telescope: orgfiles",
		},
	},
}
