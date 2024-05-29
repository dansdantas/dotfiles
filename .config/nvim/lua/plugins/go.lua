return {
	"ray-x/go.nvim",
	ft = { "go" },
	dependencies = {
		"ray-x/guihua.lua", -- recommanded if need floating window support,
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
	},
	opts = {
		luasnip = true,
		lsp_inlay_hints = { enable = false },
		lsp_codelens = false,
	},
	init = function()
		vim.keymap.set("n", ",fs", ":GoFillStruct<cr>", { desc = "GO: fill struct" })
		vim.keymap.set("n", ",fw", ":GoFillSwitch<cr>", { desc = "GO: fill switch" })
	end,
}
