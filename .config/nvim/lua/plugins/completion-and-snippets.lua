--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	{ -- Completion Engine + Sources
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		opts = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")

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

				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					---@diagnostic disable-next-line: missing-parameter
					["<C-y>"] = { i = cmp.mapping.confirm({ select = false }) },
					["<C-n>"] = { i = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }) },
					["<C-p>"] = { i = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }) },
					["<C-e>"] = { i = cmp.mapping.abort() },
					["/"] = { i = cmp.mapping.close() },

					-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<CR>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() and cmp.get_active_entry() then
								cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
							else
								fallback()
							end
						end,
						s = cmp.mapping.confirm({ select = false }),
						c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
					}),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if #cmp.get_entries() == 1 then
								cmp.confirm({ select = true })
							else
								cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
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
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
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
			}
		end,
		config = function(_, opts)
			-- Inside a snippet, use backspace to remove the placeholder.
			vim.keymap.set("s", "<BS>", "<C-O>s")

			local cmp = require("cmp")
			cmp.setup(opts)

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

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP input
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",

			"onsails/lspkind.nvim",
			"amarakon/nvim-cmp-buffer-lines",
			"lukas-reineke/cmp-under-comparator",

			"saadparwaiz1/cmp_luasnip", -- adapter for snippet engine

			-- "tamago324/cmp-zsh", -- some shell completions
			-- "dmitmel/cmp-cmdline-history",
			{
				"windwp/nvim-autopairs",
				opts = {
					disable_filetype = { "TelescopePrompt", "vim" },
				},
			},

			{ -- snippet engine
				"L3MON4D3/LuaSnip",
				event = "InsertEnter",
				dependencies = {
					"honza/vim-snippets", -- more snippets
				},
				opts = function()
					local types = require("luasnip.util.types")

					-- DOCS https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#api-reference
					return {
						region_check_events = "CursorMoved", -- prevent <Tab> jumping back to a snippet after it has been left early
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
					end, { silent = true })

					vim.keymap.set({ "i", "s" }, "<C-k>", function()
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { silent = true })

					vim.keymap.set({ "i", "s" }, "<C-j>", function()
						if luasnip.locally_jumpable(1) then
							luasnip.locally_jump(1)
						end
					end, { silent = true })

					-- Use <C-c> to select a choice in a snippet.
					vim.keymap.set({ "i", "s" }, "<C-c>", function()
						if luasnip.choice_active() then
							require("luasnip.extras.select_choice")()
						end
					end, { desc = "Select choice" })

					vim.keymap.set("i", "<C-l>", function()
						if luasnip.choice_active() then
							luasnip.change_choice(1)
						end
					end, { silent = true })

					-- extend ruby snippets to rails
					require("luasnip").filetype_extend("ruby", { "rails" })

					-- VS-code-style snippets
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip.loaders.from_snipmate").lazy_load()
					require("luasnip.loaders.from_lua").lazy_load()

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
