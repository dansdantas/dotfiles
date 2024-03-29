--# selene: allow(mixed_table) -- lazy.nvim uses them
vim.g.myLsps = { -- variable used by MasonToolInstaller
	"clangd",
	"gopls",
	"pyright", -- python LSP
	"rust_analyzer", -- rust
	"tsserver", -- ts/js
	"solargraph",
	"lua_ls",
	"vimls",

	"yamlls",
	"jsonls",

	"biome", -- ts/js/json linter/formatter
	"cssls",
	"emmet_ls", -- css/html completion

	"jedi_language_server", -- python (has much better hovers)
	"ruff_lsp", -- python linter

	"marksman", -- markdown
	"bashls", -- used for zsh
	"html",
}

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
-- LUA

-- DOCS https://luals.github.io/wiki/settings/
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
				globals = { "vim", "table", "pairs", "package", "require", "ipairs", "pcall" },
				disable = { "trailing-space" }, -- formatter already does that
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
-- PYTHON

-- DOCS https://github.com/astral-sh/ruff-lsp#settings
serverConfigs.ruff_lsp = {
	init_options = {
		-- disabled, since they are done by the ruff_fix formatter
		settings = {
			organizeImports = false, -- when "I" ruleset is added, then included in "fixAll"
			fixAll = false,
			codeAction = { fixViolation = { enable = false } },
		},
	},
	-- Disable hover in favor of jedi
	on_attach = function(ruff)
		ruff.server_capabilities.hoverProvider = false
	end,
}

-- DOCS
-- https://github.com/microsoft/pyright/blob/main/docs/settings.md
-- https://microsoft.github.io/pyright/#/settings
serverConfigs.pyright = {
	on_attach = function(pyright)
		-- Disable hover in favor of jedi
		pyright.server_capabilities.hoverProvider = false

		-- Automatically set python_path virtual env
		if not vim.env.VIRTUAL_ENV then
			return
		end
		pyright.config.settings.python.pythonPath = vim.env.VIRTUAL_ENV .. "/bin/python"
		vim.lsp.buf_notify(0, "workspace/didChangeConfiguration", { settings = pyright.config.settings })
	end,
}

-- DOCS https://github.com/pappasam/jedi-language-server#configuration
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
serverConfigs.tsserver = {
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
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = true
	end,
}

--------------------------------------------------------------------------------
-- Helpers
local function on_attach_lsp_callback(_, bufnr)
	-- Mappings.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	local tbuiltin = require("telescope.builtin")

	nmap(",rn", vim.lsp.buf.rename, "rename")
	nmap(",ca", vim.lsp.buf.code_action, "code action")

	nmap("gd", vim.lsp.buf.definition, "go to definition")
	nmap("gD", vim.lsp.buf.declaration, "go to declaration")
	nmap("gr", tbuiltin.lsp_references, "go to references")
	nmap("gi", vim.lsp.buf.implementation, "go to implementation")

	nmap("gt", ":Lspsaga finder tyd+ref+imp+def<CR>", "show type, implementation, definition and references [saga]")

	nmap("gy", vim.lsp.buf.type_definition, "type definition")
	nmap(",ds", tbuiltin.lsp_document_symbols, "document symbols")
	nmap(",ws", tbuiltin.lsp_dynamic_workspace_symbols, "workspace symbols")

	-- Diagnostics
	nmap(",e", vim.diagnostic.open_float, "open diagnostic float")

	nmap("[D", function()
		require("lspsaga.diagnostic"):goto_prev()
	end, "previous diagnostic [saga]")

	nmap("]D", function()
		require("lspsaga.diagnostic"):goto_next()
	end, "next diagnostic [saga]")

	nmap("[d", function()
		vim.diagnostic.goto_prev()
	end, "previous diagnostic")

	nmap("]d", function()
		vim.diagnostic.goto_next()
	end, "next diagnostic")

	nmap(",q", vim.diagnostic.setqflist, "move diagnostics to qlist")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "hover Documentation")
	nmap(",k", vim.lsp.buf.signature_help, "signature Documentation")

	vim.keymap.set(
		{ "i" },
		"<C-h>",
		vim.lsp.buf.signature_help,
		{ silent = true, noremap = true, desc = "LSP: toggle signature" }
	)

	-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	-- nmap('<leader>wl', function()
	--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, '[W]orkspace [L]ist Folders')
end

--------------------------------------------------------------------------------
local function lspDiagnosticSettings()
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
end

local function setupAllLsps()
	-- Enable snippets-completion (nvim_cmp) and folding (nvim-ufo)
	local lspCapabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	lspCapabilities.textDocument.completion.completionItem.snippetSupport = true
	lspCapabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

	for lsp, serverConfig in pairs(serverConfigs) do
		serverConfig.capabilities = lspCapabilities
		serverConfig.flags = { debounce_text_changes = 150 }
		serverConfig.on_attach = on_attach_lsp_callback

		require("lspconfig")[lsp].setup(serverConfig)
	end
end

return {
	{
		"neovim/nvim-lspconfig",
		init = function()
			setupAllLsps()
			lspDiagnosticSettings()
		end,
		dependencies = {
			-- ful status updates for LSP
			{ "j-hui/fidget.nvim", opts = {} },
		},
	},

	{
		"nvimdev/lspsaga.nvim",
		opts = {
			lightbulb = {
				enable = false,
			},
			symbol_in_winbar = {
				enable = false,
			},
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	{
		"rmagatti/goto-preview",
		opts = {},
		keys = {
			-- stylua: ignore start
			{ "gpd", function() require("goto-preview").goto_preview_definition() end, desc = "GoToPreview: definition" },
			{ "gpt", function() require("goto-preview").goto_preview_type_definition() end, desc = "GoToPreview: type definition" },
			{ "gpi", function() require("goto-preview").goto_preview_implementation() end, desc = "GoToPreview: implementation" },
			{ "gpD", function() require("goto-preview").goto_preview_declaration() end, desc = "GoToPreview: declaration" },
			{ "gP", function() require("goto-preview").close_all_win() end, desc = "GoToPreview: close windows" },
			{ "gpr", function() require("goto-preview").goto_preview_references() end, desc = "GoToPreview: references" },
			-- stylua: ignore end
		},
	},
}
