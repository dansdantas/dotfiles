require("config.snippets")

-- https://www.lazyvim.org/extras/coding/blink
-- https://github.com/saghen/blink.cmp
-- Documentation site: https://cmp.saghen.dev/
-- Cannot change source during execution

local get_icon_property = function(ctx)
	local icon, hl

	if vim.tbl_contains({ "Path" }, ctx.source_name) then
		local t = ctx.item.data.type
		if t == "link" then
			t = "directory"
		end

		icon, hl = require("mini.icons").get(t, ctx.label)
	end

	if not icon then
		icon = require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
		hl = ctx.kind_hl
	end

	return { icon = icon, gap = ctx.icon_gap, hl = hl }
end

require("lspkind").setup({
	symbol_map = require("icons").symbol_kinds,
})

---@module 'blink.cmp'
---@type blink.cmp.Config
require("blink.cmp").setup({
	keymap = {
		preset = "default",

		["<C-y>"] = {
			function(_)
				if require("luasnip").expandable() then
					vim.schedule(function() require("luasnip").expand() end)
					return true
				end
			end,
			"select_and_accept",
			"fallback",
		},
		["<S-y>"] = { "select_accept_and_enter" },
		["<C-j>"] = { "snippet_forward", "fallback" },
		["<C-k>"] = { "snippet_backward", "fallback" },

		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },

		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },

		["<S-k>"] = { "scroll_documentation_up", "fallback" },
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<S-j>"] = { "scroll_documentation_down", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },

		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide", "fallback" },
	},

	appearance = {
		-- sets the fallback highlight groups to nvim-cmp's highlight groups
		-- useful for when your theme doesn't support blink.cmp
		-- will be removed in a future release, assuming themes add support
		use_nvim_cmp_as_default = false,
		-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	completion = {
		accept = { auto_brackets = { enabled = true } },
		ghost_text = { enabled = false },
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
		menu = {
			draw = {
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "kind_icon", "kind", gap = 1 },
					{ "source_name" },
				},
				treesitter = { "lsp" },
				components = {
					kind_icon = {
						text = function(ctx)
							local icon = get_icon_property(ctx)
							return icon.icon .. icon.gap
						end,
						-- Optionally, use the highlight groups from mini.icons
						-- You can also add the same function for `kind.highlight` if you want to
						-- keep the highlight groups in sync with the icons.
						highlight = function(ctx) return get_icon_property(ctx).hl end,
					},
					kind = {
						-- Optional, use highlights from mini.icons
						highlight = function(ctx) return get_icon_property(ctx).hl end,
					},
				},
			},
		},
	},

	snippets = {
		preset = "luasnip",
		-- This comes from the luasnip extra, if you don't add it, won't be able to
		-- jump forward or backward in luasnip snippets
		-- https://www.lazyvim.org/extras/coding/luasnip#blinkcmp-optional
		expand = function(snippet) require("luasnip").lsp_expand(snippet) end,
		active = function(filter)
			if filter and filter.direction then
				return require("luasnip").jumpable(filter.direction)
			end
			return require("luasnip").in_snippet()
		end,
		jump = function(direction) require("luasnip").jump(direction) end,
	},

	sources = {
		-- adding any nvim-cmp sources here will enable them
		-- with blink.compat
		-- default = { "copilot", "dadbod", "emoji", "dictionary" },
		default = {
			"lazydev",
			"lsp",
			"path",
			"snippets",
			"buffer",
			"emoji",
			-- "ripgrep", -- keep commented to prevent too many results or slowdowns
		},
		providers = {
			buffer = {
				max_items = 5,
				min_keyword_length = 4,
				score_offset = 15, -- the higher the number, the higher the priority
			},
			cmdline = {
				min_keyword_length = function(ctx)
					-- when typing a command, only show when the keyword is 3 characters or longer
					if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
						return 3
					end
					return 0
				end,
			},
			-- https://github.com/moyiz/blink-emoji.nvim
			emoji = {
				module = "blink-emoji",
				name = "Emoji",
				score_offset = 15, -- the higher the number, the higher the priority
				opts = { insert = true }, -- Insert emoji (default) or complete its name
			},
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
			lsp = {
				-- Disabling fallbacks gets to always suggest snippets and buffer
				fallbacks = {},
				-- fallbacks = { "snippets", "buffer" },
				score_offset = 90,
			},
			path = {
				score_offset = 25,
				-- When typing a path, I would get snippets and text in the
				-- suggestions, I want those to show only if there are no path
				-- suggestions
				-- fallbacks = { "snippets", "buffer" },
				opts = {
					trailing_slash = false,
					label_trailing_slash = true,
					get_cwd = function(context) return vim.fn.expand(("#%d:p:h"):format(context.bufnr)) end,
					show_hidden_files_by_default = true,
				},
			},
			ripgrep = {
				module = "blink-ripgrep",
				name = "Ripgrep",
				-- see the full configuration below for all available options
				---@module "blink-ripgrep"
				---@type blink-ripgrep.Options
				opts = {},
			},
			snippets = {
				max_items = 8,
				score_offset = 85, -- the higher the number, the higher the priority
			},
			-- -- Example on how to configure dadbod found in the main repo
			-- -- https://github.com/kristijanhusak/vim-dadbod-completion
			-- dadbod = {
			-- 	name = "Dadbod",
			-- 	module = "vim_dadbod_completion.blink",
			-- 	score_offset = 85, -- the higher the number, the higher the priority
			-- },
			-- -- Third class citizen mf always talking shit
			-- copilot = {
			-- 	name = "copilot",
			-- 	enabled = true,
			-- 	module = "blink-cmp-copilot",
			-- 	kind = "Copilot",
			-- 	min_keyword_length = 6,
			-- 	score_offset = -100, -- the higher the number, the higher the priority
			-- 	async = true,
			-- },
		},
	},

	cmdline = {
		enabled = true,
		keymap = {
			preset = "cmdline",
			["<Right>"] = false,
			["<Left>"] = false,
			["<C-y>"] = { "accept", "fallback" },
			["<C-space>"] = { "accept_and_enter", "fallback" },
		},
		sources = { "cmdline", "buffer" },
		completion = {
			list = { selection = { preselect = true } },
			menu = {
				-- auto_show = function(_) return vim.fn.getcmdtype() == ":" end,
				auto_show = true,
			},
			ghost_text = { enabled = true },
		},
	},

	-- experimental signature help support
	-- signature = { enabled = true },
})
