-- load entire snippets config
require("config.snippets")

local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")
local compare = require("cmp.config.compare")

cmp.setup({
	enabled = function()
		-- disable completion in comments
		local context = require("cmp.config.context")
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = {
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-n>"] = { i = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }) },
		["<C-p>"] = { i = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }) },
		["<C-e>"] = { i = cmp.mapping.abort() },

		["<C-y>"] = cmp.mapping(function(_)
			if cmp.visible() and cmp.get_active_entry() then
				cmp.confirm({ select = false, behavior = cmp.SelectBehavior.Select })
			elseif luasnip.expandable() then
				luasnip.expand()
			else
				cmp.confirm({ select = true })
			end
		end, { "i", "s" }),
	},

	sources = cmp.config.sources({
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
	}, {
		{ name = "fuzzy_buffer" },
		{ name = "buffer-lines" },
		{ name = "async_path" },
	}, {
		{ name = "nvim_lua" },
	}),

	sorting = {
		priority_weight = 1,
		comparators = {
			require("cmp_fuzzy_buffer.compare"),
			compare.offset,
			compare.exact,
			-- compare.scopes,
			compare.score,
			require("cmp-under-comparator").under,
			compare.recently_used,
			compare.locality,
			compare.kind,
			-- compare.sort_text,
			compare.length,
			compare.order,
		},
	},

	formatting = {
		expandable_indicator = true,
		fields = { "abbr", "kind", "menu" },
		format = lspkind.cmp_format({
			maxwidth = 50,
			menu = {
				fuzzy_buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				async_path = "[path]",
				luasnip = "[snip]",
				["buffer-lines"] = "[blines]",
				rg = "[rg]",
			},
		}),
	},

	-- TODO: check https://github.com/hrsh7th/nvim-cmp/issues/1863
	-- experimental = {
	-- 	ghost_text = true,
	-- },
})

-- `/ - ?` cmdline setup.
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "fuzzy_buffer" },
		{ name = "buffer-lines" },
	},
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline({
		["<C-y>"] = cmp.mapping(function(_)
			if cmp.visible() and cmp.get_active_entry() then
				cmp.confirm({ select = false, behavior = cmp.SelectBehavior.Select })
			else
				cmp.confirm({ select = true })
			end
		end, { "c" }),
	}),
	sources = cmp.config.sources({
		{ name = "async_path", group_index = 1 },
		{
			name = "cmdline",
			keyword_length = 3,
			max_item_count = 30,
			group_index = 2,
		},
	}),
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Handle cmp ghost text with same color for comments
vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
