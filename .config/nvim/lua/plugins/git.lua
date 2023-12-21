--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	-- Git
	"tpope/vim-fugitive",

	{
		"chrisgrieser/nvim-tinygit",
		ft = { "gitrebase", "gitcommit" }, -- so ftplugins are loaded
		dependencies = {
			"stevearc/dressing.nvim",
			"rcarriga/nvim-notify", -- optional, but recommended
		},
		keys = {
			{ "<leader>gC", function() require("tinygit").smartCommit() end, desc = "Git: commit" },
			{ ",gp", function() require("tinygit").push() end, desc = "Git: push" },
			{ ",ga", function() require("tinygit").amendOnlyMsg() end, desc = "Git: commit with amend" },
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {
			numhl = true,
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
			{ "]g", function() require("gitsigns").next_hunk({navigation_message = false, wrap = false}) end, desc = "Git: next hunk" },
			{ "[g", function() require("gitsigns").prev_hunk({navigation_message = false, wrap = false}) end, desc = "Git: previous hunk" },
			{ "<leader>gn", function() require("gitsigns").next_hunk({navigation_message = false}) end, desc = "Git: next hunk" },
			{ "<leader>gp", function() require("gitsigns").prev_hunk({navigation_message = false}) end, desc = "Git: previous hunk" },
			{ "<leader>ga", function() require("gitsigns").stage_hunk() end, desc = "Git: add hunk" },
			{ "<leader>gA", function() require("gitsigns").stage_buffer() end, desc = "Git: stage buffer" },
			{ "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, desc = "Git: unstage hunk" },
			{ "<leader>gU", function() require("gitsigns").reset_buffer_index() end, desc = "Git: unstage buffer" },
			{ "<leader>gP", function() require("gitsigns").preview_hunk() end, desc = "Git: preview hunk" },
			{ ",gh", function() require("gitsigns").select_hunk() end, desc = "Git: select hunk" },
			{ "ih", function() require("gitsigns").select_hunk() end, mode = { "o", "x" }, desc = "Git: hunk" },
			
			{ "<leader>gd", function() require("gitsigns").diffthis() end, desc = "Git: diff file" },
			{ "<leader>gq", function() require("gitsigns").setqflist() end, desc = "Git: populate hunks to loclist" },
			{ "<leader>gt", function() require("gitsigns").toggle_deleted() end, desc = "Git: toggle deleted hunks" },
			{ "<leader>gR", function() require("gitsigns").reset_buffer() end, desc = "Git: reset buffer" },
			{ "<leader>gr", function() require("gitsigns").reset_hunk() end, desc = "Git: reset hunk" },
			{ "<leader>gb", function() require("gitsigns").blame_line() end, desc = "Git: blame line" },
			{ "<leader>gB", function() require("gitsigns").blame_line({ full = true }) end, desc = "Git: blame full" },

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
				desc = "Git: status"
			},
			{ "<leader>gc", ":Git commit<cr>", desc = "Git: commit" },
			{ "<leader>g!", ":Git commit --amend<cr>", desc = "Git: commit with amend" },
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
