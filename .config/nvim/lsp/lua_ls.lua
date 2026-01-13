return {
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
