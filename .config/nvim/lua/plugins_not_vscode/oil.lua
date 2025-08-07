return {
	"stevearc/oil.nvim",
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{ "-", function() require("oil").open_float() end, desc = "Oil: open" },
	},
}
