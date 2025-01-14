return {
	{
		"chrisgrieser/nvim-tinygit",
		ft = { "gitrebase", "gitcommit" }, -- so ftplugins are loaded
		dependencies = {
			"stevearc/dressing.nvim",
			"rcarriga/nvim-notify", -- optional, but recommended
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		event = { "User FilePost" },
		config = function() require("config.git") end,
	},

	{
		"sindrets/diffview.nvim",
		opts = {
			hooks = {
				diff_buf_read = function()
					-- Change local options in diff buffers
					vim.opt_local.wrap = false
					vim.opt_local.list = false
					vim.opt_local.colorcolumn = { 80 }
				end,
			},
		},
	},

	{
		"akinsho/git-conflict.nvim",
		event = "VeryLazy",
		opts = {
			default_mappings = {
				ours = "<leader>g1",
				theirs = "<leader>g2",
				none = "<leader>g0",
				both = "<leader>g3",
				prev = "[x",
				next = "]x",
			},
			disable_diagnostics = true,
		},
	},

	{ "linrongbin16/gitlinker.nvim", opts = { highlight_duration = 0 } },
	{ "FabijanZulj/blame.nvim", opts = {}, cmd = { "BlameToggle" } },
}
