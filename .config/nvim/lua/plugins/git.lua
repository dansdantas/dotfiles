--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	-- Git
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"tommcdo/vim-fubitive", -- Bitbucket support on fugitive GBrowse

	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_", show_count = true },
				topdelete = { text = "‾", show_count = true },
				changedelete = { text = "~", show_count = true },
			},
		},
		keys = {
			-- stylua: ignore start
			{ "]g", function() require("gitsigns").next_hunk() end, desc = "next hunk" },
			{ "[g", function() require("gitsigns").prev_hunk() end, desc = "previous hunk" },
			{ "<leader>ga", function() require("gitsigns").stage_hunk() end, "add hunk" },
			{ "<leader>gA", function() require("gitsigns").stage_buffer() end, "stage entire buffer" },
			{ "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, "unstage hunk" },
			{ "<leader>gU", function() require("gitsigns").reset_buffer_index() end, "unstage entire buffer" },
			{ "<leader>gp", function() require("gitsigns").preview_hunk() end, "preview hunk" },
			{ ",gh", function() require("gitsigns").select_hunk() end, "select hunk" },

			{ "<leader>gd", function() require("gitsigns").diffthis() end, "diff file" },
			{ "<leader>gq", function() require("gitsigns").setqflist() end, "populate hunks to loclist" },
			{ "<leader>gt", function() require("gitsigns").toggle_deleted() end, "toggle deleted hunks" },
			{ "<leader>gR", function() require("gitsigns").reset_buffer() end, "reset buffer" },
			{ "<leader>gb", function() require("gitsigns").blame_line({ full = true }) end, desc = "[B]lame" },

			{
				"<leader>gs",
				function() 
					if vim.env.GIT_WORK_TREE then
						vim.cmd([[Git status]])
					else
						require("telescope.builtin").git_status()
					end
				end,
				desc = "[B]lame"
			},
			{ "<leader>gc", ":Git commit<cr>", desc = "commit" },
			{ "<leader>g!", ":Git commit --amend<cr>", desc = "commit with amend" },
			{ ",ga", ":Git commit --amend<cr>", desc = "commit with amend" },
		},
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
}
