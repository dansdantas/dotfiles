--# selene: allow(mixed_table) -- lazy.nvim uses them
local function config()
	-- plugins
	local wk = require("which-key")

	wk.setup({})

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
end

return {
	"folke/which-key.nvim",
	config = config,
}
