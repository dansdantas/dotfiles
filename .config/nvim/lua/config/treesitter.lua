vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"comment",
		"cpp",
		"css",
		"dockerfile",
		"go",
		"graphql",
		"html",
		"http",
		"java",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"lua",
		"make",
		"markdown",
		"python",
		"r",
		"regex",
		"ruby",
		"rust",
		"scss",
		"terraform",
		"typescript",
		"vim",
		"vue",
		"yaml",
	},

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		disable = { "css" },
	},

	indent = { enable = true },
	endwise = { enable = true },
	matchup = { enable = true },

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<c-backspace>",
		},
	},

	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["aC"] = "@class.outer",
				["iC"] = "@class.inner",
				["ic"] = "@call.inner",
				["ac"] = "@call.outer",
				["aH"] = "@assignment.lhs",
				["ah"] = "@assignment.inner",
				["aL"] = "@assignment.rhs",
				["al"] = "@assignment.outer",
			},
			-- You can choose the select mode (default is charwise 'v')
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * method: eg 'v' or 'o'
			-- and should return the mode ('v', 'V', or '<c-v>') or a table
			-- mapping query_strings to modes.
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding or succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * selection_mode: eg 'v'
			-- and should return true of false
			include_surrounding_whitespace = true,
		},

		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = "@function.outer",
				["]c"] = "@class.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[c"] = "@class.outer",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]C"] = "@class.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[C"] = "@class.outer",
			},
		},

		swap = {
			enable = true,
			swap_next = {
				["<leader>sj"] = "@parameter.inner",
				[",sj"] = "@assignment.inner",
				[",sJ"] = "@attribute.inner",
			},
			swap_previous = {
				["<leader>sk"] = "@parameter.inner",
				[",sk"] = "@assignment.inner",
				[",sK"] = "@attribute.inner",
			},
		},

		lsp_interop = {
			enable = true,
			border = "none",
			floating_preview_opts = {},
			peek_definition_code = {
				[",pf"] = "@function.outer",
				[",pF"] = "@class.outer",
			},
		},
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.gotmpl = {
	install_info = {
		url = "https://github.com/ngalaiko/tree-sitter-go-template",
		files = { "src/parser.c" },
	},
	filetype = "gotmpl",
	used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
}

-- keymaps
local set = vim.keymap.set
set("n", "<space>st", function() require("treesj").toggle() end, { desc = "TS: toggle split/join param" })
set("n", "<space>sc", function() require("treesj").join() end, { desc = "TS: join params" })
set("n", "<space>sp", function() require("treesj").split() end, { desc = "TS: split params" })

set("n", "<space>sl", function() require("sibling-swap").swap_with_right() end, { desc = "TS: swap right" })
set("n", "<space>sh", function() require("sibling-swap").swap_with_left() end, { desc = "TS: swap left " })

set("n", "gx", function()
	-- select URL
	require("various-textobjs").url()

	local foundURL = vim.fn.mode():find("v")
	if foundURL then
		-- retrieve URL with the z-register as intermediary
		vim.cmd.normal({ '"zy', bang = true })
		local url = tostring(vim.fn.getreg("z"))

		-- open with the OS-specific shell command
		vim.ui.open(url)
	else
		-- find all URLs in buffer
		local urlPattern = [[%l%l%l-://[^%s)"'`]+]]
		local bufText = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
		local urls = {}
		for url in bufText:gmatch(urlPattern) do
			table.insert(urls, url)
		end
		if #urls == 0 then
			vim.notify("No URLs found on the buffer", vim.log.levels.INFO)
			return
		end

		-- select one, use a plugin like dressing.nvim for nicer UI for
		-- `vim.ui.select`
		vim.ui.select(urls, { prompt = "Select URL:" }, function(choice)
			if choice then
				vim.ui.open(choice)
			end
		end)
	end
end, { desc = "URL Opener" })

set("n", "dsi", function()
	require("various-textobjs").indentation("outer", "outer")

	-- plugin only switches to visual mode when a textobj has been found
	local indentationFound = vim.fn.mode():find("V")
	if not indentationFound then
		return
	end

	-- dedent indentation
	vim.cmd.normal({ "<", bang = true })

	-- delete surrounding lines
	local endBorderLn = vim.api.nvim_buf_get_mark(0, ">")[1]
	local startBorderLn = vim.api.nvim_buf_get_mark(0, "<")[1]

	vim.cmd(tostring(endBorderLn) .. " delete") -- delete end first so line index is not shifted
	vim.cmd(tostring(startBorderLn) .. " delete")
end, { desc = "Delete surrounding indentation" })

-- when on unindented line, `ii` should select entire buffer
set("o", "ii", function()
	if vim.fn.indent(".") == 0 then
		require("various-textobjs").entireBuffer()
	else
		require("various-textobjs").indentation("inner", "inner")
	end
end)
