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
		{ ",do", function() require("dapui").open() end, desc = "[D]ap open" },
		{ ",dx", function() require("dapui").close() end, desc = "[D]ap open" },
		{ ",dc", function() require("dap").continue() end, desc = "[D]ap [C]ontinue"},
		{ ",dp", function() require("dap").step_into() end, desc = "[D]ap step over" },
		{ ",dn", function() require("dap").step_over() end, desc = "[D]ap step into" },
		{ ",dO", function() require("dap").step_out() end, desc = "[D]ap step out" },
		{ ",dt", function() require("dap").toggle_breakpoint() end, desc = "[D]ap [T]oggle breakpoint" },
		{ ",de", function() require("dap-go").debug_test() end, desc = "[D]ap D[e]bug" },
		-- stylua: ignore end

		{
			",db",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "[D]ap set breakpoint",
		},

		{
			",dl",
			function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
			desc = "[D]ap set [l]og point message",
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
