local status, null = pcall(require, "null-ls")
if not status then
	return
end

local formatting = null.builtins.formatting
local diagnostics = null.builtins.diagnostics

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "eslint_d", "rubocop", "prettierd" },
})

local sources = {
	formatting.stylua,
	formatting.eslint_d,
	formatting.prettierd,

	null.builtins.completion.luasnip,
	null.builtins.code_actions.eslint,
}

for _, diag in pairs({ "eslint_d", "rubocop", "selene" }) do
	table.insert(
		sources,
		diagnostics[diag].with({
			diagnostics_format = "[" .. diag .. "] #{m}\n(#{c})",
		})
	)
end

null.setup({
	sources = sources,
})
