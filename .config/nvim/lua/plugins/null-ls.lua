local status, null = pcall(require, "null-ls")
if not status then
	return
end

local formatting = null.builtins.formatting
local diagnostics = null.builtins.diagnostics

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "eslint_d", "prettierd" },
})

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
	on_attach = require("functions").on_attach_lsp,
	debouce = 150,
	diagnostics_format = "[#{c}] #{m} (#{s})",
	diagnostic_config = {
		method = null.methods.DIAGNOSTICS_ON_SAVE,
	}
})
