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

	null.builtins.completion.luasnip,
	null.builtins.code_actions.eslint,
}

for _, diag in pairs({ "eslint_d", "selene", "golangci_lint" }) do
	table.insert(
		sources,
		diagnostics[diag].with({
			diagnostics_format = "[" .. diag .. "] #{m}\n(#{c})",
		})
	)
end

null.setup({
	sources = sources,
	on_attach = require("functions").on_attach_lsp,
})
