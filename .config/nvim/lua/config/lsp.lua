local M = {}

--------------------------------------------------------------------------------
--- Servers in use
--------------------------------------------------------------------------------

-- variable used by MasonToolInstaller
vim.g.myLsps = {
	"clangd",
	"gopls",
	"jdtls",
	"jedi_language_server", -- python (has much better hovers)
	"rust_analyzer", -- rust
	"solargraph",

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
}

--------------------------------------------------------------------------------
--- Server definitions spec
--------------------------------------------------------------------------------

---@class (exact) lspConfiguration see https://github.com/neovim/nvim-lspconfig/blob/master/doc/lspconfig.txt#L46
---@field settings? table <string, table>
---@field root_dir? function(filename, bufnr)
---@field filetypes? string[]
---@field init_options? table <string, string|table|boolean>
---@field on_attach? function(client, bufnr)
---@field on_new_config? function(new_config, root_dir)
---@field capabilities? table <string, string|table|boolean|function>
---@field cmd? string[]
---@field autostart? boolean
---@field single_file_support? boolean
---@field flags? table<string, integer>

---@type table<string, lspConfiguration>
local serverConfigs = {}
for _, lsp in pairs(vim.g.myLsps) do
	serverConfigs[lsp] = {}
end

--------------------------------------------------------------------------------
-- LUA - DOCS https://luals.github.io/wiki/settings/
serverConfigs.lua_ls = {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				-- path = runtime_path,
			},
			completion = {
				callSnippet = "Replace",
				keywordSnippet = "Replace",
				displayContext = 6,
				showWord = "Disable", -- don't suggest common words as fallback
				postfix = ".", -- useful for `table.insert` and the like
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				-- if there is a .luarc.json on current workspace, it takes precedence over this
				globals = { "vim", "table", "pairs", "package", "require", "ipairs", "pcall", "P", "R", "Snacks" },
				-- Review missing fields and inject field after every version upgrade
				disable = { "trailing-space", "missing-fields", "inject-field" }, -- formatter already does that
			},
			format = { enable = false },
			hint = {
				enable = true, -- enabled inlay hints
				setType = true,
				arrayIndex = "Disable",
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				-- library = vim.api.nvim_get_runtime_file("", true),
				library = { vim.env.VIMRUNTIME },
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = { enable = false },
		},
	},
}

--------------------------------------------------------------------------------
-- Ruby
serverConfigs.solargraph = {
	autostart = false,
	settings = {
		init_options = {
			formatting = true,
		},
		solargraph = {
			diagnostics = true,
		},
	},
}

--------------------------------------------------------------------------------
-- GO
serverConfigs.gopls = {
	cmd = { "gopls" },
	settings = {
		gopls = {
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
			semanticTokens = true,
			gofumpt = true,
		},
	},
	init_options = {
		usePlaceholders = true,
	},
}

--------------------------------------------------------------------------------
-- Rust
serverConfigs.rust_analyzer = {
	cmd = { "rustup", "run", "stable", "rust-analyzer" },
}

--------------------------------------------------------------------------------
-- Java
serverConfigs.jdtls = {
	root_dir = function()
		-- vim.fn.getcwd()
		return vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1])
	end,
}

--------------------------------------------------------------------------------
-- PYTHON -  DOCS https://github.com/pappasam/jedi-language-server#configuration
serverConfigs.jedi_language_server = {
	init_options = {
		diagnostics = { enable = true },
		codeAction = { nameExtractVariable = "extracted_var", nameExtractFunction = "extracted_def" },
	},
	-- HACK since init_options cannot be changed during runtime, we need to use
	-- `on_new_config` to set it. Since at `vim.env.VIRTUAL_ENV` is
	-- not set in time, we need to hardcode the identification of the
	-- venv-dir here
	on_new_config = function(config, root_dir)
		local venv_python = root_dir .. "/.venv/bin/python"
		if vim.fn.executable(venv_python) ~= 1 then
			return
		end
		config.init_options.workspace = {
			environmentPath = venv_python,
		}
	end,
}

--------------------------------------------------------------------------------
-- JS/TS/CSS

-- don't pollute completions for js/ts with stuff I don't need
serverConfigs.emmet_ls = {
	filetypes = { "html", "css" },
}

-- DOCS
-- https://github.com/sublimelsp/LSP-css/blob/master/LSP-css.sublime-settings
-- https://github.com/microsoft/vscode-css-languageservice/blob/main/src/services/lintRules.ts
serverConfigs.cssls = {
	settings = {
		css = {
			colorDecorators = { enable = true }, -- color inlay hints
			lint = {
				compatibleVendorPrefixes = "ignore",
				vendorPrefix = "ignore",
				unknownVendorSpecificProperties = "ignore",
				unknownProperties = "ignore", -- duplicate with stylelint
				duplicateProperties = "warning",
				emptyRules = "warning",
				importStatement = "warning",
				zeroUnits = "warning",
				fontFaceProperties = "warning",
				hexColorLength = "warning",
				argumentsInColorFunction = "warning",
				unknownAtRules = "warning",
				ieHack = "warning",
				propertyIgnoredDueToDisplay = "warning",
			},
		},
	},
}

-- DOCS https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
serverConfigs.ts_ls = {
	settings = {
		-- enable checking javascript without a `jsconfig.json`
		implicitProjectConfiguration = { -- DOCS https://www.typescriptlang.org/tsconfig
			checkJs = true,
			target = "ES2022", -- JXA is compliant with most of ECMAScript: https://github.com/JXA-Cookbook/JXA-Cookbook/wiki/ES6-Features-in-JXA
		},

		-- INFO "cannot redeclare block-scoped variable" -> not useful for JXA.
		-- Biome works on single-file-mode and therefore can be used to check for
		-- unintended re-declaring
		diagnostics = { ignoredCodes = { 2451 } },

		typescript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			},
		},
	},
}

-- DOCS https://github.com/redhat-developer/yaml-language-server/tree/main#language-server-settings
serverConfigs.yamlls = {
	settings = {
		yaml = {
			format = {
				enable = true,
				printWidth = 120,
			},
		},
	},
	-- SIC needs enabling via setting *and* via capabilities to work
	-- TODO probably due to missing dynamic formatting in nvim
	on_attach = function(client) client.server_capabilities.documentFormattingProvider = true end,
}

--------------------------------------------------------------------------------
--- Startup functions
--------------------------------------------------------------------------------

local function setupLsps()
	-- Enable snippets-completion (nvim_cmp) and folding (nvim-ufo)
	local lspCapabilities = vim.lsp.protocol.make_client_capabilities()
	lspCapabilities.textDocument.completion.completionItem.snippetSupport = true
	lspCapabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }
	lspCapabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

	-- Completion configuration
	vim.tbl_deep_extend("force", lspCapabilities, require("cmp_nvim_lsp").default_capabilities())
	lspCapabilities.textDocument.completion.completionItem.insertReplaceSupport = false

	for lsp, serverConfig in pairs(serverConfigs) do
		serverConfig.capabilities = lspCapabilities
		serverConfig.flags = { debounce_text_changes = 150 }

		require("lspconfig")[lsp].setup(serverConfig)
	end
end

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
	setupLsps()
end

return M
