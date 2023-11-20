return {
	-- Git
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"tommcdo/vim-fubitive", -- Bitbucket support on fugitive GBrowse

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_", show_count = true },
				topdelete = { text = "‾", show_count = true },
				changedelete = { text = "~", show_count = true },
			},
		},
	},

	{
		"TimUntersberger/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		module = true,
		config = function()
			require("neogit").setup({
				integrations = {
					diffview = true,
				},
			})
			require("diffview").setup({
				hooks = {
					diff_buf_read = function()
						-- Change local options in diff buffers
						vim.opt_local.wrap = false
						vim.opt_local.list = false
						vim.opt_local.colorcolumn = { 80 }
					end,
				},
			})
		end,
	},
}
