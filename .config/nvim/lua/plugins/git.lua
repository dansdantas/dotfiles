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
			{ "]g", function() require("gitsigns").next_hunk({navigation_message = false, wrap = false}) end, desc = "next hunk" },
			{ "[g", function() require("gitsigns").prev_hunk({navigation_message = false, wrap = false}) end, desc = "previous hunk" },
			{ "<leader>ga", function() require("gitsigns").stage_hunk() end, desc = "add hunk" },
			{ "<leader>gA", function() require("gitsigns").stage_buffer() end, desc = "stage entire buffer" },
			{ "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, desc = "unstage hunk" },
			{ "<leader>gU", function() require("gitsigns").reset_buffer_index() end, desc = "unstage entire buffer" },
			{ "<leader>gp", function() require("gitsigns").preview_hunk() end, desc = "preview hunk" },
			{ ",gh", function() require("gitsigns").select_hunk() end, desc = "select hunk" },

			{ "<leader>gd", function() require("gitsigns").diffthis() end, desc = "diff file" },
			{ "<leader>gq", function() require("gitsigns").setqflist() end, desc = "populate hunks to loclist" },
			{ "<leader>gt", function() require("gitsigns").toggle_deleted() end, desc = "toggle deleted hunks" },
			{ "<leader>gR", function() require("gitsigns").reset_buffer() end, desc = "reset buffer" },
			{ "<leader>gb", function() require("gitsigns").blame_line() end, desc = "blame line virtual" },
			{ "<leader>gB", function() require("gitsigns").blame_line({ full = true }) end, desc = "blame line" },

			{
				"<leader>gs",
				function() 
					local opts = {}

					-- Env variables GIT_WORK_TREE and GIT_DIR solves problems with not finding git still need conditional
					-- because of expanding files with -u tries to read every file on $HOME
					if vim.env.GIT_WORK_TREE == vim.env.HOME then
						opts.expand_dir = false
					end

					require("telescope.builtin").git_status(opts)
				end,
				desc = "git status"
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
