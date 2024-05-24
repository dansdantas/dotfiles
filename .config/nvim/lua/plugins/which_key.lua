return {
	"folke/which-key.nvim",
	opts = {},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- Leader mappings
		wk.register({
			b = { name = "buffer" },
			g = { name = "git" },
			s = { name = "swap" },
			t = { name = "telescope" },
			v = { name = "vim" },
		}, { prefix = "<leader>" })

		-- Only for declaration purposes
		wk.register({
			c = { name = "clipboard" },
			d = { name = "dap" },
			g = { name = "git" },
			h = { name = "help" },
			p = { name = "peek" },
			t = { name = "testing" },
			w = { name = "workspace" },
		}, { prefix = "," })
	end,
}
