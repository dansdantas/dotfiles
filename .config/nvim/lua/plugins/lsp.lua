require("fidget").setup({})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup lspconfig.
local lsp = require("lspconfig")

local default_conf = {
	flags = { debounce_text_changes = 150 },
	capabilities = capabilities,
	on_attach = require("functions").on_attach_lsp,
}

local utils = require("utils")

for server, conf in pairs(utils.lsp_server_configs) do
	local base_conf = table.copy(default_conf)
	local full_conf = table.merge(base_conf, conf)
	lsp[server].setup(full_conf)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
	underline = true,
	signs = true,
	update_in_insert = false,
	show_diagnostic_autocmds = { "InsertLeave" },
})

vim.diagnostic.config({
	update_in_insert = false,
})
