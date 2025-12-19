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

	{
		"esmuellert/vscode-diff.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		cmd = "CodeDiff",
		branch = "next",
		opts = {
			-- Highlight configuration
			highlights = {
				-- Line-level: accepts highlight group names or hex colors (e.g., "#2ea043")
				line_insert = "DiffAdd", -- Line-level insertions
				line_delete = "DiffDelete", -- Line-level deletions

				-- Character-level: accepts highlight group names or hex colors
				-- If specified, these override char_brightness calculation
				char_insert = nil, -- Character-level insertions (nil = auto-derive)
				char_delete = nil, -- Character-level deletions (nil = auto-derive)

				-- Brightness multiplier (only used when char_insert/char_delete are nil)
				-- nil = auto-detect based on background (1.4 for dark, 0.92 for light)
				char_brightness = nil, -- Auto-adjust based on your colorscheme
			},

			-- Diff view behavior
			diff = {
				disable_inlay_hints = true, -- Disable inlay hints in diff windows for cleaner view
				max_computation_time_ms = 5000, -- Maximum time for diff computation (VSCode default)
			},

			-- Explorer panel configuration
			explorer = {
				position = "left", -- "left" or "bottom"
				width = 40, -- Width when position is "left" (columns)
				height = 15, -- Height when position is "bottom" (lines)
			},

			-- Keymaps in diff view
			keymaps = {
				view = {
					quit = "q", -- Close diff tab
					toggle_explorer = "<leader>b", -- Toggle explorer visibility (explorer mode only)
					next_hunk = "]c", -- Jump to next change
					prev_hunk = "[c", -- Jump to previous change
					next_file = "]f", -- Next file in explorer mode
					prev_file = "[f", -- Previous file in explorer mode
					diff_get = "do", -- Get change from other buffer (like vimdiff)
					diff_put = "dp", -- Put change to other buffer (like vimdiff)
				},
				explorer = {
					select = "<CR>", -- Open diff for selected file
					hover = "K", -- Show file diff preview
					refresh = "R", -- Refresh git status
				},
			},
		},
	},
}
