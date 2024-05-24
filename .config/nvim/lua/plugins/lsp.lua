return {
	"neovim/nvim-lspconfig",
	event = { "User FilePost" },
	config = function() require("config.lsp").setup() end,
	dependencies = {
		"folke/neodev.nvim",
		{ "j-hui/fidget.nvim", opts = {} }, -- ful status updates for LSP

		-- Mason suite
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Format & Linter
		"stevearc/conform.nvim",
		"mfussenegger/nvim-lint",
	},
}
