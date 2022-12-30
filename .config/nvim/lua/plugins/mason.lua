local utils = require("utils")

require("mason").setup({
	PATH = "append",
	ui = {
		check_outdated_packages_on_open = false,
	},
})

require("mason-lspconfig").setup({
	ensure_installed = utils.lsp_server_names(),
})

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "eslint_d", "prettierd", "goimports", "selene", "golangci_lint", "eslint" },
})
