local dap = require("dap")
local dapui = require("dapui")

dapui.setup({
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

-- Automatically open the UI when a new debug session is created.
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open({}) end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close({}) end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close({}) end

-- Lua configurations
dap.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
end

dap.configurations["lua"] = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
	},
}

-- keymaps
local set = vim.keymap.set

set("n", ",do", function() require("dapui").open() end, { desc = "Dap: open" })
set("n", ",dx", function() require("dapui").close() end, { desc = "Dap: close" })
set("n", ",dc", function() require("dap").continue() end, { desc = "Dap: continue" })
set("n", ",dO", function() require("dap").step_into() end, { desc = "Dap: step over" })
set("n", ",di", function() require("dap").step_over() end, { desc = "Dap: step into" })
set("n", ",do", function() require("dap").step_out() end, { desc = "Dap: step out" })
set("n", ",dt", function() require("dap").toggle_breakpoint() end, { desc = "Dap: toggle breakpoint" })
set("n", ",dr", function() require("dap").restart() end, { desc = "Dap: restart" })
set("n", ",dX", function() require("dap").terminate() end, { desc = "Dap: terminate" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.keymap.set("n", ",de", function() require("dap-go").debug_test() end, { desc = "Dap: debug" })
	end,
})

set("n", ",de", function()
	require("dapui").eval()
	require("dapui").eval()
end, { desc = "Dap: eval" })

set(
	"n",
	",db",
	function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
	{ desc = "Dap: set breakpoint" }
)

set(
	"n",
	",dl",
	function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
	{ desc = "Dap: set log point message" }
)
