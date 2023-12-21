--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	"folke/which-key.nvim",
	opts = {},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- Leader mappings
		wk.register({
			g = { name = "git" },
			t = { name = "telescope" },
			b = { name = "buffer" },
		}, { prefix = "<leader>" })

		-- Only for declaration purposes
		wk.register({
			d = { name = "dap" },
			g = { name = "git" },
			t = { name = "testing" },
			w = { name = "workspace" },
		}, { prefix = "," })
	end,
}
