local types = require("luasnip.util.types")
local ls = require("luasnip")

-- DOCS https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#api-reference
ls.setup({
	region_check_events = { "CursorMoved", "InsertEnter" }, -- prevent <Tab> jumping back to a snippet after it has been left early
	delete_check_events = { "InsertLeave" },
	update_events = { "TextChanged", "TextChangedI" }, -- live updating of snippets
	ext_opts = {
		[types.insertNode] = {
			unvisited = {
				virt_text = { { "|", "Conceal" } },
				virt_text_pos = "inline",
			},
		},
		[types.exitNode] = {
			unvisited = {
				virt_text = { { "|", "Conceal" } },
				virt_text_pos = "inline",
			},
		},
	},
	snip_env = {
		-- Helper function for showing a snippet if the Treesitter node
		-- satisfies a given predicate.
		ts_show = function(pred)
			return function()
				local row, col = unpack(vim.api.nvim_win_get_cursor(0))
				local ok, node = pcall(vim.treesitter.get_node, { pos = { row - 1, col - 1 } })

				-- Show the snippet if Treesitter bails.
				if not ok or not node then
					return true
				end

				return pred(node:type())
			end
		end,
	},
})

-- extend ruby snippets to rails
require("luasnip").filetype_extend("ruby", { "rails" })

-- VS-code-style snippets
require("luasnip.loaders.from_vscode").lazy_load({ exclude = { "lua" } })
require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip.loaders.from_lua").lazy_load({ paths = { "./lua/snips" } })

-- keymaps
local set = vim.keymap.set

set({ "i", "s" }, "<C-space>", function()
	if ls.expand_or_locally_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true, desc = "Snip: expand or jump locally" })

set({ "i", "s" }, "<C-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true, desc = "Snip: jump backwards" })

set({ "i", "s" }, "<C-j>", function()
	if ls.locally_jumpable(1) then
		ls.jump(1)
	end
end, { silent = true, desc = "Snip: jump forwards" })

-- Use <C-c> to select a choice in a snippet.
set({ "i", "s" }, "<C-c>", function()
	if ls.choice_active() then
		require("luasnip.extras.select_choice")()
	end
end, { desc = "Snip: select choice" })

set("i", "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true, desc = "Snip: next choice" })

-- Inside a snippet, use backspace to remove the placeholder.
set("s", "<BS>", "<C-O>s")

vim.api.nvim_create_autocmd("ModeChanged", {
	group = vim.api.nvim_create_augroup("personal/unlink_snippet", { clear = true }),
	desc = "Cancel the snippet session when leaving insert mode",
	pattern = { "s:n", "i:*" },
	callback = function(args)
		if
			ls.session
			and ls.session.current_nodes[args.buf]
			and not ls.session.jump_active
			and not ls.choice_active()
		then
			ls.unlink_current()
		end
	end,
})
