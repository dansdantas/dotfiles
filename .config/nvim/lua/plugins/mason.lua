--# selene: allow(mixed_table) -- lazy.nvim uses them
local function config()
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
		debouce = 150,
		diagnostics_format = "[#{c}] #{m} (#{s})",
		diagnostic_config = { method = null.methods.DIAGNOSTICS_ON_SAVE },
	})
end

return {
	{ -- Linters
		"jose-elias-alvarez/null-ls.nvim",
		config = config,
		dependencies = {
			{
				"jayp0521/mason-null-ls.nvim",
				opts = {
					ensure_installed = { "stylua", "prettierd", "goimports", "selene", "golangci_lint" },
				},
			},
		},
	},
}
