return {
	{
		"stevearc/overseer.nvim",
		-- cmd = { "OverseerRun", "OverseerQuickAction" },
		config = function(_, opts)
			local overseer = require("overseer")
			overseer.setup(opts)
			overseer.patch_dap(true)

			overseer.register_template({
				name = "run",
				builder = function()
					return {
						cmd = { "go" },
						args = { "run", vim.api.nvim_buf_get_name(0) },
					}
				end,
			})

			vim.keymap.set("n", ",rf", ":OverseerRun run<cr>", { desc = "Run file" })
			vim.keymap.set("n", ",rr", ":OverseerQuickAction restart<cr>", { desc = "Run file" })
		end,
		opts = {
			strategy = {
				"toggleterm",
				use_shell = true,
				direction = "float",
			},
		},
		dependencies = {
			"nvim-neotest/nvim-nio",
			"akinsho/toggleterm.nvim",
		},
	},
}
