local M = {}

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

M.server_configs = {
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

M.server_names = function()
	local names = {}
	for server, _ in pairs(M.server_configs) do
		table.insert(names, server)
	end

	return names
end

local filetype = function(bufnr)
	return vim.filetype.match({ filename = vim.api.nvim_buf_get_name(bufnr) })
end

M.on_attach = function(_, bufnr)
	-- Mappings.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	local tbuiltin = require("telescope.builtin")

	nmap(",rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap(",ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", tbuiltin.lsp_references, "[G]oto [R]eferences")
	nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("gt", ":Lspsaga finder tyd+ref+imp+def<CR>", "Show type, implementation, definition and references")

	nmap("gy", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap(",ds", tbuiltin.lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap(",ws", tbuiltin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- Diagnostics
	nmap(",e", vim.diagnostic.open_float, "Open diagnostic float")
	nmap("[d", ":Lspsaga diagnostic_jump_prev<CR>", "Previous diagnostic")
	nmap("]d", ":Lspsaga diagnostic_jump_next<CR>", "Next diagnostic")
	nmap(",q", vim.diagnostic.setqflist, "Move diagnostics to qlist")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap(",k", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

	-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	-- nmap('<leader>wl', function()
	--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, '[W]orkspace [L]ist Folders')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format({
			filter = function(client)
				if filetype(bufnr) == "lua" then
					-- For lua files use formatter from null-ls
					-- apply whatever logic you want (in this example, we'll only use null-ls)
					return client.name == "null-ls"
				end
				return true
			end,
			bufnr = bufnr,
			async = true,
		})
	end, { desc = "Format current buffer with LSP" })

	nmap(",f", ":Format<cr>", "Format current buffer with LSP")

	vim.keymap.set("v", ",f", function()
		vim.lsp.buf.format({
			range = {
				start = vim.api.nvim_buf_get_mark(bufnr, "<"),
				["end"] = vim.api.nvim_buf_get_mark(bufnr, ">"),
			},
			async = true,
		})
	end, { desc = "LSP: range formatting" })

	vim.keymap.set(
		{ "i" },
		"<C-h>",
		vim.lsp.buf.signature_help,
		{ silent = true, noremap = true, desc = "toggle signature" }
	)
end

return M
