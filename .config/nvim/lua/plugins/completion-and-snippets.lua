--# selene: allow(mixed_table) -- lazy.nvim uses them
local function config()
	vim.opt.completeopt = { "menu", "menuone", "noselect" }

	local has_words_before = function()
		if vim.api.nvim_get_option_value("buftype", {}) == "prompt" then
			return false
		end
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local cmp = require("cmp")
	local lspkind = require("lspkind")
	local luasnip = require("luasnip")

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

		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			---@diagnostic disable-next-line: missing-parameter
			["<C-y>"] = { i = cmp.mapping.confirm({ select = false }) },
			["<C-n>"] = { i = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }) },
			["<C-p>"] = { i = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }) },
			["<C-e>"] = { i = cmp.mapping.abort() },

			-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			["<CR>"] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() and cmp.get_active_entry() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
					else
						fallback()
					end
				end,
				s = cmp.mapping.confirm({ select = true }),
				c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
			}),

			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					if #cmp.get_entries() == 1 then
						cmp.confirm({ select = true })
					else
						cmp.select_next_item()
					end
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
					if #cmp.get_entries() == 1 then
						cmp.confirm({ select = true })
					end
				else
					fallback()
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),

			["<C-j>"] = cmp.mapping(function(fallback)
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end),
		}),

		sources = cmp.config.sources({
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
		}, {
			{ name = "buffer", keyword_length = 3 },
			{ name = "buffer-lines" },
			{ name = "path" },
		}, {
			{ name = "nvim_lua" },
		}),

		formatting = {
			format = lspkind.cmp_format({
				maxwidth = 50,
				menu = {
					buffer = "[buf]",
					nvim_lsp = "[LSP]",
					nvim_lua = "[api]",
					path = "[path]",
					luasnip = "[snip]",
				},
			}),
		},

		experimental = {
			ghost_text = true,
		},
	})

	vim.keymap.set({ "i", "s" }, "<C-k>", function()
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		end
	end, { silent = true })

	vim.keymap.set({ "i", "s" }, "<C-space>", function()
		if luasnip.expand_or_locally_jumpable() then
			luasnip.expand_or_jump()
		end
	end, { silent = true })

	vim.keymap.set({ "i", "s" }, "<C-j>", function()
		if luasnip.locally_jumpable(1) then
			luasnip.locally_jump(1)
		end
	end, { silent = true })

	vim.keymap.set("i", "<C-l>", function()
		if luasnip.choice_active() then
			luasnip.change_choice(1)
		end
	end, { silent = true })

	-- `/` cmdline setup.
	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer", keyword_length = 3 },
		},
	})

	-- `:` cmdline setup.
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path", group_index = 1 },
			{
				name = "cmdline",
				keyword_length = 5,
				max_item_count = 30,
				group_index = 2,
			},
		}),
	})

	require("luasnip").config.set_config({
		history = true,
	})

	-- DOCS https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#api-reference
	require("luasnip").setup({
		region_check_events = "CursorMoved", -- prevent <Tab> jumping back to a snippet after it has been left early
		update_events = { "TextChanged", "TextChangedI" }, -- live updating of snippets
	})

	require("luasnip").filetype_extend("ruby", { "rails" })

	-- VS-code-style snippets
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_snipmate").lazy_load()
	require("luasnip.loaders.from_lua").lazy_load()

	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return {
	{ -- Completion Engine + Sources
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		config = config,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP input
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"onsails/lspkind.nvim",
			"amarakon/nvim-cmp-buffer-lines",
			"lukas-reineke/cmp-under-comparator",

			{ "L3MON4D3/LuaSnip", event = "InsertEnter" }, -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- adapter for snippet engine
			"honza/vim-snippets", -- more snippets

			-- "tamago324/cmp-zsh", -- some shell completions
			-- "dmitmel/cmp-cmdline-history",
		},
	},
}
