local M = {}

M.add_to_todo = function()
	local branch_name = vim.fn.system([[printf $(git rev-parse --abbrev-ref HEAD)]])
	vim.fn.execute("normal! i @todo " .. branch_name .. " -")
end

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "dotfiles",
		cwd = "$HOME",
		find_command = {
			"dot",
			"ls-tree",
			"--full-tree",
			"-r",
			"--name-only",
			"HEAD",
		},
	})
end

M.folding_toggle = function()
	if vim.fn.foldlevel(".") == 0 then
		-- No fold exists at the current line,
		-- so create a fold based on indentation

		local l_min = vim.fn.line(".") -- current line number
		local l_max = vim.fn.line("$") --  last line number
		local i_min = vim.fn.indent(".") -- indentation of the current line
		local l = l_min + 1

		local isBlank = function(x)
			return not not tostring(x):find("^%s*$")
		end
		-- Search downward for the last line whose indentation > i_min
		while l <= l_max do
			-- if this line is not blank ...
			local line = vim.fn.getline(l)
			local line_length = vim.fn.strlen(line)

			if line_length > 0 and not isBlank(line) then
				if vim.fn.indent(l) <= i_min then
					-- we've gone too far
					l = l - 1 -- backtrack one line
					break
				end
			end

			l = l + 1
		end

		-- Clamp l to the last line
		if l > l_max then
			l = l_max
		end

		-- " Backtrack to the last non-blank line
		while l > l_min do
			local line = vim.fn.getline(l)
			local line_length = vim.fn.strlen(line)

			if line_length > 0 and not isBlank(l) then
				break
			end

			l = l - 1
		end

		-- "execute "normal i" . l_min . "," . l . " fold"   print debug info

		if l > l_min then
			-- Create the fold from l_min to l
			vim.fn.execute(l_min .. "," .. l .. " fold")
		end
	else
		-- Delete the fold on the current line
		vim.cmd([[normal zd]])
	end
end

M.help_on_current_word = function()
	return vim.cmd("help " .. vim.fn.expand("<cword>"))
end

M.search_current_word = function()
	return vim.cmd("Ag " .. vim.fn.expand("<cword>") .. "<cr>")
end

local filetype = function(bufnr)
	return vim.filetype.match({ filename = vim.api.nvim_buf_get_name(bufnr) })
end

local lsp_formatting = function(bufnr)
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
end

M.on_attach_lsp = function(_, bufnr)
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
		-- vim.lsp.buf.format({ async = true })
		lsp_formatting(bufnr)
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
