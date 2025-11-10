return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		config = function(_, opts)
			require("snacks").setup(opts)
			require("config.snacks")
		end,
		opts = {
			bigfile = { enabled = true },
			notifier = { enabled = true },
			input = { enabled = true },
			picker = {
				files = { hidden = true },
				previewers = { git = { native = true }, diff = { style = "terminal" } },
				win = {
					input = {
						keys = {
							["<Esc>"] = { "close", mode = { "n", "i" } },
							["<c-x>"] = { "edit_split", mode = { "i", "n" } },
							["<c-t>"] = { "edit_tab", mode = { "i", "n" } },
						},
					},
				},
			},
			-- indent = { enabled = true },
			-- this messes with sessions saved values
			-- statuscolumn = { enabled = true },
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		},
		-- config = function(_, opts)
		-- 	local notify = vim.notify
		-- 	require("snacks").setup(opts)
		-- 	-- HACK: restore vim.notify after snacks setup and let noice.nvim take over
		-- 	-- this is needed to have early notifications show up in noice history
		-- 	if LazyVim.has("noice.nvim") then
		-- 		vim.notify = notify
		-- 	end
		-- end,
	},
}
