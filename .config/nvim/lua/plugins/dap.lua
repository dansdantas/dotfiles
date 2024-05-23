return {
	"mfussenegger/nvim-dap",
	config = function() require("config.dap") end,
	dependencies = {
		"nvim-telescope/telescope-dap.nvim",
		{ "theHamsta/nvim-dap-virtual-text", opts = { virt_text_pos = "eol" } },
		{ "leoluz/nvim-dap-go", opts = {} },
		{ "rcarriga/nvim-dap-ui" },
	},
}
