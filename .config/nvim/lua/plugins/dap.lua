--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Automatically open the UI when a new debug session is created.
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({})
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close({})
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close({})
		end
	end,
	keys = {
		-- stylua: ignore start
		{ ",do", function() require("dapui").open() end, desc = "Dap: open" },
		{ ",dx", function() require("dapui").close() end, desc = "Dap: close" },
		{ ",dc", function() require("dap").continue() end, desc = "Dap: continue"},
		{ ",dO", function() require("dap").step_into() end, desc = "Dap: step over" },
		{ ",di", function() require("dap").step_over() end, desc = "Dap: step into" },
		{ ",do", function() require("dap").step_out() end, desc = "Dap: step out" },
		{ ",dt", function() require("dap").toggle_breakpoint() end, desc = "Dap: toggle breakpoint" },
		{ ",de", function() require("dap-go").debug_test() end, desc = "Dap: debug" },
		-- stylua: ignore end

		{
			",db",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Dap: set breakpoint",
		},

		{
			",dl",
			function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
			desc = "Dap: set log point message",
		},
	},
	dependencies = {
		"nvim-telescope/telescope-dap.nvim",
		{ "theHamsta/nvim-dap-virtual-text", opts = { virt_text_pos = "eol" } },
		{ "leoluz/nvim-dap-go", opts = {} },
		{
			"rcarriga/nvim-dap-ui",
			opts = {
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
			},
		},
	},
}
