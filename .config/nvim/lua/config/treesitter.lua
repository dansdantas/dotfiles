vim.g.ts_install = {
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
	"vimdoc",
	"vue",
	"yaml",
}

local ts = require("nvim-treesitter")
local ts_install = vim.g.ts_install or {}
local ts_filetypes = vim.iter(ts_install)
	:map(function(lang) return vim.treesitter.language.get_filetypes(lang) end)
	:flatten()
	:totable()

ts.install(ts_install)

vim.api.nvim_create_autocmd("FileType", {
	desc = "Setup treesitter for a buffer",
	-- NOTE: We explicitly define filetypes
	pattern = ts_filetypes,
	group = vim.api.nvim_create_augroup("ts_setup", { clear = true }),
	callback = function(e)
		-- Start highlighting immediately (works if parser exists)
		-- local lang = vim.treesitter.language.get_lang(e.match) or e.match
		-- pcall(vim.treesitter.start, e.buf, lang)

		vim.treesitter.start(e.buf)

		-- indentation
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

		-- folding
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
})

require("nvim-treesitter.parsers").gotmpl = {
	install_info = {
		url = "https://github.com/ngalaiko/tree-sitter-go-template",
		files = { "src/parser.c" },
	},
	filetype = "gotmpl",
	used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
}

require("nvim-treesitter-textobjects").setup({
	select = {
		-- Automatically jump forward to textobj, similar to targets.vim
		lookahead = true,

		-- You can choose the select mode (default is charwise 'v')
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
		include_surrounding_whitespace = false,
	},
	move = {
		set_jumps = true, -- whether to set jumps in the jumplist
	},
})

-- keymaps
local set = vim.keymap.set

local select_ts = require("nvim-treesitter-textobjects.select").select_textobject
set({ "x", "o" }, "aa", function() select_ts("@parameter.outer", "textobjects") end)
set({ "x", "o" }, "ia", function() select_ts("@parameter.inner", "textobjects") end)
set({ "x", "o" }, "af", function() select_ts("@function.outer", "textobjects") end)
set({ "x", "o" }, "if", function() select_ts("@function.inner", "textobjects") end)
set({ "x", "o" }, "aC", function() select_ts("@class.outer", "textobjects") end)
set({ "x", "o" }, "iC", function() select_ts("@class.inner", "textobjects") end)
set({ "x", "o" }, "ac", function() select_ts("@call.outer", "textobjects") end)
set({ "x", "o" }, "ic", function() select_ts("@call.inner", "textobjects") end)
set({ "x", "o" }, "ah", function() select_ts("@assignment.lhs", "textobjects") end)
set({ "x", "o" }, "aH", function() select_ts("@assignment.inner", "textobjects") end)
set({ "x", "o" }, "al", function() select_ts("@assignment.rhs", "textobjects") end)
set({ "x", "o" }, "aL", function() select_ts("@assignment.outer", "textobjects") end)
-- You can also use captures from other query groups like `locals.scm`
set({ "x", "o" }, "as", function() select_ts("@local.scope", "locals") end)

local move = require("nvim-treesitter-textobjects.move")
set({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer", "textobjects") end)
set({ "n", "x", "o" }, "]c", function() move.goto_next_start("@class.outer", "textobjects") end)
set({ "n", "x", "o" }, "]F", function() move.goto_next_end("@function.outer", "textobjects") end)
set({ "n", "x", "o" }, "]C", function() move.goto_next_end("@class.outer", "textobjects") end)

set({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@function.outer", "textobjects") end)
set({ "n", "x", "o" }, "[c", function() move.goto_previous_start("@class.outer", "textobjects") end)

set({ "n", "x", "o" }, "[F", function() move.goto_previous_end("@function.outer", "textobjects") end)
set({ "n", "x", "o" }, "[C", function() move.goto_previous_end("@class.outer", "textobjects") end)
-- set(
-- 	{ "n", "x", "o" },
-- 	"]o",
-- 	function()
-- 		move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
-- 	end
-- )
-- set(
-- 	{ "n", "x", "o" },
-- 	"]s",
-- 	function() move.goto_next_start("@local.scope", "locals") end
-- )
-- set(
-- 	{ "n", "x", "o" },
-- 	"]z",
-- 	function() move.goto_next_start("@fold", "folds") end
-- )

-- Go to either the start or the end, whichever is closer.
-- Use if you want more granular movements
-- set(
-- 	{ "n", "x", "o" },
-- 	"]d",
-- 	function() move.goto_next("@conditional.outer", "textobjects") end
-- )
-- set(
-- 	{ "n", "x", "o" },
-- 	"[d",
-- 	function() move.goto_previous("@conditional.outer", "textobjects") end
-- )

local swap = require("nvim-treesitter-textobjects.swap")
set("n", "<leader>sj", function() swap.swap_next("@parameter.inner") end)
set("n", ",sj", function() swap.swap_next("@assignment.inner") end)
set("n", ",sJ", function() swap.swap_next("@attribute.inner") end)

set("n", "<leader>sk", function() swap.swap_previous("@parameter.inner") end)
set("n", ",sk", function() swap.swap_previous("@assignment.inner") end)
set("n", ",sK", function() swap.swap_previous("@attribute.outer") end)

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
