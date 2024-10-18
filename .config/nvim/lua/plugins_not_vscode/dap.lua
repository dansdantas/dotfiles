return {
	"mfussenegger/nvim-dap",
	config = function() require("config.dap") end,
	dependencies = {
		"nvim-telescope/telescope-dap.nvim",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		{ "theHamsta/nvim-dap-virtual-text", opts = { virt_text_pos = "eol" } },
		{ "leoluz/nvim-dap-go", opts = {} },
		{
			"jbyuki/one-small-step-for-vimkind",
			keys = {
				{
					",dS",
					function() require("osv").launch({ port = 8086 }) end,
					mode = { "n" },
					desc = "Dap: start osv",
				},
			},
		},
	},
}
