local M = {}

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

M.lsp_server_configs = {
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
	rust_analyzer = {
		cmd = { "rustup", "run", "stable", "rust-analyzer" },
	},
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
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Setup your lua path
					-- path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim", "table", "pairs", "package", "require", "ipairs", "pcall" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					-- library = vim.api.nvim_get_runtime_file("", true),
					library = { vim.env.VIMRUNTIME },
					checkThirdParty = false,
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = { enable = false },

				-- color = { mode = { Grammar = true } },
				-- editor = { semanticHighlighting = { enabled = true } },
				-- semantic = { enable = true },
			},
		},
	},
}

function M.lsp_server_names()
	local names = {}
	for server, _ in pairs(M.lsp_server_configs) do
		table.insert(names, server)
	end

	return names
end

return M
