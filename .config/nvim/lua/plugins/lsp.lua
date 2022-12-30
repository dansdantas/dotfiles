local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("fidget").setup({})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup lspconfig.
local lsp = require("lspconfig")

local servers = {
	clangd = {},
	gopls = {
		cmd = { "gopls" },
		settings = {
			gopls = {
				experimentalPostfixCompletions = true,
				analyses = {
					unusedparams = true,
					shadow = true,
				},
				staticcheck = true,
			},
		},
		init_options = {
			usePlaceholders = true,
		},
	},
	pyright = {},
	rust_analyzer = {},
	tsserver = {},
	vimls = {},
	solargraph = {
		autostart = false,
		settings = {
			init_options = {
				formatting = true,
			},
			solargraph = {
				diagnostics = true,
			},
		},
	},
	sumneko_lua = {
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Setup your lua path
					path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim", "table", "pairs", "package", "require", "ipairs", "pcall" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = { enable = false },
			},
		},
	},
}

local default_conf = {
	flags = { debounce_text_changes = 150 },
	capabilities = capabilities,
	on_attach = require("functions").on_attach_lsp,
}

for server, conf in pairs(servers) do
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
