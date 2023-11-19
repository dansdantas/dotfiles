local function config()
	local lsp = require("lsp.utils")

	require("mason").setup({
		PATH = "append",
		ui = {
			check_outdated_packages_on_open = false,
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = lsp.server_names(),
	})

	require("mason-null-ls").setup({
		ensure_installed = { "stylua", "eslint_d", "prettierd", "goimports", "selene", "golangci_lint", "eslint" },
	})

	local status, null = pcall(require, "null-ls")
	if not status then
		return
	end

	local formatting = null.builtins.formatting
	local diagnostics = null.builtins.diagnostics

	local sources = {
		formatting.eslint_d,
		formatting.prettierd,
		formatting.goimports,
		formatting.stylua,

		diagnostics.eslint_d,
		diagnostics.selene,
		diagnostics.golangci_lint,

		null.builtins.completion.luasnip,
		null.builtins.code_actions.eslint,
	}

	null.setup({
		sources = sources,
		on_attach = require("lsp.utils").on_attach,
		debouce = 150,
		diagnostics_format = "[#{c}] #{m} (#{s})",
		diagnostic_config = { method = null.methods.DIAGNOSTICS_ON_SAVE },
	})
end

return {
	{
		-- Automatically install LSPs to stdpath for neovim
		{ "williamboman/mason.nvim", config = config },
		"williamboman/mason-lspconfig.nvim",

		-- ful status updates for LSP
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
	},

	{ -- Linters
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"jayp0521/mason-null-ls.nvim",
		},
	},
}
