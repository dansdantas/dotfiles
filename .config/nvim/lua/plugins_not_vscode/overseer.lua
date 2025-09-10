return {
	{
		"stevearc/overseer.nvim",
		config = function(_, opts)
			local overseer = require("overseer")
			overseer.setup(opts)
			overseer.patch_dap(true)

			overseer.register_template({
				name = "run",
				builder = function()
					local file = vim.fn.expand("%:p")
					local cmd = { file }

					if vim.bo.filetype == "go" then
						cmd = { "go", "run", file }
					end

					if vim.bo.filetype == "rust" then
						cmd = { "cargo", "run", file }
					end

					return {
						cmd = cmd,
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
