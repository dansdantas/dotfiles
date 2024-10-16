return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup({ n_lines = 500 })

		require("mini.bracketed").setup({
			treesitter = { suffix = "s", options = {} },
		})

		require("mini.hipatterns").setup({
			highlighters = {
				fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
				hack = { pattern = "HACK", group = "MiniHipatternsHack" },
				part = { pattern = "PARTIAL", group = "MiniHipatternsHack" },
				todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
				note = { pattern = "NOTE", group = "MiniHipatternsNote" },
				done = { pattern = "DONE", group = "MiniHipatternsNote" },
			},
		})

		require("mini.git").setup({
			command = { split = "horizontal" },
		})
	end,
}
