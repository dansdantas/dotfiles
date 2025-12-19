return {
	{
		"stevearc/overseer.nvim",
		config = function(_, opts)
			local overseer = require("overseer")
			overseer.setup(opts)
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

			vim.api.nvim_create_user_command("Grep", function(params)
				-- Insert args at the '$*' in the grepprg
				local cmd, num_subs = vim.o.grepprg:gsub("%$%*", params.args)
				if num_subs == 0 then
					cmd = cmd .. " " .. params.args
				end
				local task = overseer.new_task({
					cmd = vim.fn.expandcmd(cmd),
					components = {
						{
							"on_output_quickfix",
							errorformat = vim.o.grepformat,
							open = not params.bang,
							open_height = 8,
							items_only = true,
						},
						-- We don't care to keep this around as long as most tasks
						{ "on_complete_dispose", timeout = 30 },
						"default",
					},
				})
				task:start()
			end, { nargs = "*", bang = true, complete = "file" })
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
