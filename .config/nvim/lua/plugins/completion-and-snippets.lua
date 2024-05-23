--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	{ -- Completion Engine + Sources
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		opts = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")
			local compare = require("cmp.config.compare")

			local has_words_before = function()
				if vim.api.nvim_get_option_value("buftype", {}) == "prompt" then
					return false
				end
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			return {
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
				experimental = {
					ghost_text = true,
				},
			}
		end,
		config = function(_, opts)
			-- Inside a snippet, use backspace to remove the placeholder.
			vim.keymap.set("s", "<BS>", "<C-O>s")

			local cmp = require("cmp")
			cmp.setup(opts)

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
		end,
		dependencies = {
			-- sources
			"saadparwaiz1/cmp_luasnip", -- adapter for snippet engine
			{ "tzachar/cmp-fuzzy-buffer", dependencies = { "tzachar/fuzzy.nvim" } },
			"amarakon/nvim-cmp-buffer-lines",
			"hrsh7th/cmp-nvim-lsp", -- LSP input
			"FelipeLema/cmp-async-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",

			-- "tamago324/cmp-zsh", -- some shell completions
			-- "dmitmel/cmp-cmdline-history",

			"onsails/lspkind.nvim", -- format source type
			"lukas-reineke/cmp-under-comparator", -- sort underline completion items
			"windwp/nvim-autopairs", -- rules and opts defined in their own file

			{ -- snippet engine
				"L3MON4D3/LuaSnip",
				event = "InsertEnter",
				dependencies = {
					"honza/vim-snippets", -- more snippets
					"rafamadriz/friendly-snippets", -- vsode like snippets
				},
				opts = function()
					local types = require("luasnip.util.types")

					-- DOCS https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#api-reference
					return {
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
					}
				end,
				config = function(_, opts)
					local luasnip = require("luasnip")
					luasnip.setup(opts)

					vim.keymap.set({ "i", "s" }, "<C-space>", function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { silent = true, desc = "Snip: expand or jump locally" })

					vim.keymap.set({ "i", "s" }, "<C-k>", function()
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { silent = true, desc = "Snip: jump backwards" })

					vim.keymap.set({ "i", "s" }, "<C-j>", function()
						if luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						end
					end, { silent = true, desc = "Snip: jump forwards" })

					-- Use <C-c> to select a choice in a snippet.
					vim.keymap.set({ "i", "s" }, "<C-c>", function()
						if luasnip.choice_active() then
							require("luasnip.extras.select_choice")()
						end
					end, { desc = "Snip: select choice" })

					vim.keymap.set("i", "<C-l>", function()
						if luasnip.choice_active() then
							luasnip.change_choice(1)
						end
					end, { silent = true, desc = "Snip: next choice" })

					-- extend ruby snippets to rails
					require("luasnip").filetype_extend("ruby", { "rails" })

					-- VS-code-style snippets
					require("luasnip.loaders.from_vscode").lazy_load({ exclude = { "lua" } })
					require("luasnip.loaders.from_snipmate").lazy_load()
					require("luasnip.loaders.from_lua").lazy_load({ paths = { "./lua/snips" } })

					vim.api.nvim_create_autocmd("ModeChanged", {
						group = vim.api.nvim_create_augroup("personal/unlink_snippet", { clear = true }),
						desc = "Cancel the snippet session when leaving insert mode",
						pattern = { "s:n", "i:*" },
						callback = function(args)
							if
								luasnip.session
								and luasnip.session.current_nodes[args.buf]
								and not luasnip.session.jump_active
								and not luasnip.choice_active()
							then
								luasnip.unlink_current()
							end
						end,
					})
				end,
			},
		},
	},
}
