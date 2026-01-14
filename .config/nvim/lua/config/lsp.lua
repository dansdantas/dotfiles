local M = {}

--------------------------------------------------------------------------------
--- Servers in use
--------------------------------------------------------------------------------

-- variable used by MasonToolInstaller
vim.g.myLsps = {
	"clangd",
	"jdtls",
	"jedi_language_server", -- python (has much better hovers)

	"gopls",
	"solargraph",
	-- "ruby_lsp",
	"dockerls",

	"biome", -- ts/js/json linter/formatter
	"cssls",
	"emmet_ls", -- css/html completion
	"html",
	"htmx",
	"ts_ls", -- ts/js

	"lua_ls",
	"vimls",

	"yamlls",
	"jsonls",
	"marksman", -- markdown
	"bashls", -- used for zsh
	"taplo",
}

--------------------------------------------------------------------------------
--- Base config
--------------------------------------------------------------------------------
local lspCapabilities = vim.lsp.protocol.make_client_capabilities()
lspCapabilities.textDocument.completion.completionItem.snippetSupport = true
lspCapabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }
lspCapabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

-- Completion configuration
-- vim.tbl_deep_extend("force", lspCapabilities, require("cmp_nvim_lsp").default_capabilities())
vim.tbl_deep_extend("force", lspCapabilities, require("blink.cmp").get_lsp_capabilities({}, false))
lspCapabilities.textDocument.completion.completionItem.insertReplaceSupport = false

vim.lsp.config("*", {
	capabilities = lspCapabilities,
	flags = { debounce_text_changes = 150 },
})

local sev = vim.diagnostic.severity
vim.diagnostic.config({
	-- Show signs on top of any other sign, but only for warnings and errors
	signs = { priority = 9999, severity = { min = sev.WARN, max = sev.ERROR } },

	-- Show all diagnostics as underline
	underline = { severity = { min = sev.HINT, max = sev.ERROR } },

	-- Show more details immediately for errors on the current line
	virtual_lines = false,
	virtual_text = {
		current_line = true,
		severity = { min = sev.ERROR, max = sev.ERROR },
	},

	-- Don't update diagnostics when typing
	update_in_insert = false,
})

vim.lsp.enable(vim.g.myLsps)

--------------------------------------------------------------------------------
--- Startup functions
--------------------------------------------------------------------------------

local function setupProgress()
	require("lsp-progress").setup({
		client_format = function(client_name, spinner, series_messages)
			if #series_messages == 0 then
				return nil
			end
			return {
				name = client_name,
				body = spinner .. " " .. table.concat(series_messages, ", "),
			}
		end,
		format = function(client_messages)
			--- @param name string
			--- @param msg string?
			--- @return string
			local function stringify(name, msg) return msg and string.format("%s %s", name, msg) or name end

			local sign = " " -- nf-fa-gear \uf013
			local lsp_clients = vim.lsp.get_clients()
			local messages_map = {}
			for _, climsg in ipairs(client_messages) do
				messages_map[climsg.name] = climsg.body
			end

			if #lsp_clients > 0 then
				table.sort(lsp_clients, function(a, b) return a.name < b.name end)
				local builder = {}
				for _, cli in ipairs(lsp_clients) do
					if type(cli) == "table" and type(cli.name) == "string" and string.len(cli.name) > 0 then
						if messages_map[cli.name] then
							table.insert(builder, stringify(cli.name, messages_map[cli.name]))
						else
							table.insert(builder, stringify(cli.name))
						end
					end
				end
				if #builder > 0 then
					return sign .. " " .. table.concat(builder, ", ")
				end
			end
			return ""
		end,
	})
end

M.setup = function()
	require("config.linter").setup()

	setupProgress()
end

return M
