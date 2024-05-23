--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	{
		"nvim-telescope/telescope.nvim",
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			-- Enable extensions if they are installed
			pcall(telescope.load_extension, "ui-select")
			pcall(telescope.load_extension, "file_browser")
			pcall(telescope.load_extension, "fzf")
			pcall(telescope.load_extension, "egrepify")
			pcall(telescope.load_extension, "lazy_plugins")
		end,

		opts = function()
			local actions = require("telescope.actions")
			local layout = require("telescope.actions.layout")
			local fb_actions = require("telescope").extensions.file_browser.actions

			local toggle_dark_mode = function()
				local mode = { ["light"] = "dark", ["dark"] = "light" }
				---@diagnostic disable-next-line: undefined-field
				vim.opt.background = mode[vim.opt.background:get()]
			end

			return {
				defaults = {
					results_title = false,
					dynamic_preview_title = true,

					preview = {
						timeout = 400, -- ms
						filesize_limit = 1, -- Mb
						ls_short = true, -- ls is only used when displaying directories
					},

					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-q>"] = actions.send_to_qflist,
							["<C-s>"] = actions.cycle_previewers_next,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-f>"] = actions.preview_scrolling_down,
							["<C-b>"] = actions.preview_scrolling_up,
							["<Esc>"] = actions.close,
							["<C-r>"] = actions.select_all,
							["<A-t>"] = layout.toggle_preview,
						},
						n = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-f>"] = actions.preview_scrolling_down,
							["<C-b>"] = actions.preview_scrolling_up,
							["<A-t>"] = layout.toggle_preview,
						},
					},
				},

				pickers = {
					colorscheme = {
						enable_preview = true,
						mappings = {
							i = { ["<c-t>"] = toggle_dark_mode },
							n = { ["<c-t>"] = toggle_dark_mode },
						},
					},
				},

				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					file_browser = {
						theme = "dropdown",
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						mappings = {
							-- your custom insert mode mappings
							["i"] = {
								["<C-w>"] = function()
									vim.cmd("normal vbd")
								end,
							},
							["n"] = {
								-- your custom normal mode mappings
								["N"] = fb_actions.create,
								["h"] = fb_actions.goto_parent_dir,
								["/"] = function()
									vim.cmd("startinsert")
								end,
							},
						},
					},
					lazy_plugins = {
						picker_opts = {
							sorting_strategy = "descending",
						},
					},
				},
			}
		end,

		keys = {
			-- stylua: ignore start
			{
				"<C-p>",
				function()
					local theme = require("telescope.themes").get_ivy({
						winblend = 10,
						previewer = true,
					})

					require("telescope.builtin").git_files(theme)
				end,
				desc = "Telescope: project files",
			},
			{ "<leader>o", function() require("telescope.builtin").find_files() end, desc = "Telescope: files"  },
			{ "<leader><leader>", function() require("telescope.builtin").buffers() end, desc = "Telescope: buffers" },
			{ "<leader>td", function() require("config.utils").search_dotfiles() end, desc = "Telescope: dotfiles" },
			{ "<leader>tw", function() require("telescope.builtin").grep_string() end, desc = "Telescope: find word" },
			{ "<leader>tg", function() require("telescope.builtin").live_grep() end, desc = "Telescope: grep" },
			{ "<leader>tG", function() require("telescope").extensions.egrepify.egrepify{} end, desc = "Telescope: egrepify" },
			{ "<leader>tl", function() require("telescope").extensions.lazy_plugins.lazy_plugins{} end, desc = "Telescope: lazy plugins" },
			{ "tl", function() require("telescope").extensions.lazy_plugins.lazy_plugins{} end, desc = "Telescope: lazy plugins" },
			{ "<leader>sf", function() require("telescope.builtin").live_grep{grep_open_files = true} end, desc = "Telescope: grep on open files" },
			{ "<leader>t?", function() require("telescope.builtin").oldfiles() end, desc = "Telescope: recent files" },
			{ "<leader>tq", function() require("telescope.builtin").quickfix() end, desc = "Telescope: quickfix entries" },
			{ "<leader>tc", function() require("telescope.builtin").colorscheme() end, desc = "Telescope: colors" },
			{ "<leader>tn", function() require("telescope.builtin").find_files{ cwd = vim.fn.stdpath('config'), prompt_title = 'Neovim config' } end, desc = "Telescope: neovim config directory" },
			{ "<leader>sn", function() require("telescope.builtin").live_grep{ cwd = vim.fn.stdpath('config'), prompt_title = 'Searching through neovim config' } end, desc = "Telescope: grep on neovim config" },
			{ "<leader>tr", function() require("telescope.builtin").resume() end, desc = "Telescope: resume" },

			{ "<leader>ts", function() require("telescope.builtin").grep_string({ search = [[TODO:|todo!\(.*\)]] }) end, desc = "Telescope: grep todos" },

			{
				"<leader>tf", 
				function()
					return require("telescope.builtin").find_files({ previewer = false })
				end,
				desc = "Telescope: files without preview",
			},

			{
				"<leader>/",
				function()
					-- You can pass additional configuration to telescope to change theme, layout, etc.
					local dropdown = require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					})

					require("telescope.builtin").current_buffer_fuzzy_find(dropdown)
				end,
				desc = "Telescope: fuzzily search in current buffer",
			},

			{
				"<leader>tb",
				function ()
					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					require("telescope").extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = telescope_buffer_dir(),
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						previewer = false,
						initial_mode = "normal",
						layout_config = { height = 40 },
					})
				end,
				desc = "Telescope: file browser",
			},

			-- Vim
			{ "<leader>vC", function() require("telescope.builtin").command_history() end, desc = "Vim: command history" },
			{ "<leader>vc", function() require("telescope.builtin").commands() end, desc = "Vim: commands" },
			{ "<leader>vh", function() require("telescope.builtin").help_tags() end, desc = "Vim: help" },
			{ "<leader>vd", function() require("telescope.builtin").diagnostics() end, desc = "Vim: diagnostics" },
			{ "<leader>vk", function() require("telescope.builtin").keymaps() end, desc = "Vim: keymaps" },
			{ "<leader>vo", function() require("telescope.builtin").vim_options() end, desc = "Vim: options" },

			-- Git
			{ ",gb", function() require("telescope.builtin").git_branches() end, desc = "Git: branches" },
			{ ",gc", function() require("telescope.builtin").git_commits() end, desc = "Git: commits" },
			{ ",gC", function() require("telescope.builtin").git_bcommits() end, desc = "Git: commits for current buffer" },
			-- stylua: ignore end
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"polirritmico/telescope-lazy-plugins.nvim",
			{ "fdschmidt93/telescope-egrepify.nvim", dependencies = "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
	},
}
