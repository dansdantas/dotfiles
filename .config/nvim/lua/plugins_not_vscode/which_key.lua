return {
	"folke/which-key.nvim",
	opts = {},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		wk.add({
			{ "<leader>b", group = "buffer" },
			{ "<leader>g", group = "git" },
			{ "<leader>s", group = "swap" },
			{ "<leader>t", group = "telescope" },
			{ "<leader>v", group = "vim" },

			{ ",c", group = "clipboard" },
			{ ",d", group = "dap" },
			{ ",g", group = "git" },
			{ ",h", group = "help" },
			{ ",p", group = "peek" },
			{ ",t", group = "testing" },
			{ ",w", group = "workspace" },
		})
	end,
}
