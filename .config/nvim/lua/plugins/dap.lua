--# selene: allow(mixed_table) -- lazy.nvim uses them
local function config()
	local dap = require("dap")

	vim.keymap.set("n", ",do", require("dapui").open, { desc = "[D]ap open" })
	vim.keymap.set("n", ",dx", require("dapui").close, { desc = "[D]ap open" })
	vim.keymap.set("n", ",dc", dap.continue, { desc = "[D]ap [C]ontinue" })
	vim.keymap.set("n", ",dp", dap.step_into, { desc = "[D]ap step over" })
	vim.keymap.set("n", ",dn", dap.step_over, { desc = "[D]ap step into" })
	vim.keymap.set("n", ",dO", dap.step_out, { desc = "[D]ap step out" })
	vim.keymap.set("n", ",dt", dap.toggle_breakpoint, { desc = "[D]ap [T]oggle breakpoint" })
	vim.keymap.set("n", ",de", require("dap-go").debug_test, { desc = "[D]ap D[e]bug" })

	vim.keymap.set("n", ",db", function()
		return dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end, { desc = "[D]ap set breakpoint" })

	vim.keymap.set("n", ",dl", function()
		dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
	end, { desc = "[D]ap set [l]og point message" })

	require("nvim-dap-virtual-text").setup({})
	require("dap-go").setup({})
	require("dapui").setup({
		expand_lines = true,
		layouts = {
			{
				elements = {
					-- Elements can be strings or table with id and size keys.
					{ id = "scopes", size = 0.25 },
					"breakpoints",
					"stacks",
					"watches",
				},
				size = 40, -- 40 columns
				position = "left",
			},
			{
				elements = {
					"repl",
					"console",
				},
				size = 0.25, -- 25% of total lines
				position = "bottom",
			},
		},
	})

	local dapui = require("dapui")
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open({})
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close({})
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close({})
	end
end

return {
	"mfussenegger/nvim-dap",
	config = config,
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
		"leoluz/nvim-dap-go",
	},
}
