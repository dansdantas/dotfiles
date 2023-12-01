--# selene: allow(mixed_table) -- lazy.nvim uses them
local function config()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local fb_actions = require("telescope").extensions.file_browser.actions

	telescope.setup({
		defaults = {
			results_title = false,
			dynamic_preview_title = true,

			preview = {
				timeout = 400, -- ms
				filesize_limit = 1, -- Mb
				ls_short = true, -- ls is only used when displaying directories
			},

			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--trim",
			},

			mappings = {
				i = {
					["C-x"] = false,
					["<C-q>"] = actions.send_to_qflist,
					["<C-s>"] = actions.cycle_previewers_next,
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-b>"] = actions.preview_scrolling_down,
					["<C-f>"] = actions.preview_scrolling_up,
					["<Esc>"] = actions.close,
					["<C-r>"] = actions.select_all,
				},
				n = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-b>"] = actions.preview_scrolling_down,
					["<C-f>"] = actions.preview_scrolling_up,
				},
			},

			pickers = {
				find_files = {
					find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
				},
			},
		},

		extensions = {
			fzy_native = {
				override_generic_sorter = false,
				override_file_sorter = true,
			},
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
		},
	})

	telescope.load_extension("ui-select")
	telescope.load_extension("file_browser")
	telescope.load_extension("fzf")
end

return {
	{
		"nvim-telescope/telescope.nvim",
		config = config,
		keys = {
			-- stylua: ignore start
			{ "<C-p>", function() require("telescope.builtin").git_files() end, desc = "project files" },
			{ "<leader>to", function() require("telescope.builtin").find_files() end, desc = "[O]pen files"  },
			{ "<leader>tb", function() require("telescope.builtin").buffers() end, desc = "[B]uffers" },
			{ "<leader>td", function() require("config.utils").search_dotfiles() end, desc = "[D]otfiles" },
			{ "<leader>tw", function() require("telescope.builtin").grep_string() end, desc = "find [W]ord" },
			{ "<leader>tg", function() require("telescope.builtin").live_grep() end, desc = "by [G]rep" },
			{ "<leader>t?", function() require("telescope.builtin").oldfiles() end, desc = "recent files" },

			{ "<leader>ts", function() require("telescope.builtin").grep_string({ search = [[TODO:|todo!\(.*\)]] }) end, desc = "grep todos" },

			{
				"<leader>f", 
				function()
					return require("telescope.builtin").find_files({ previewer = false })
				end,
				desc = "files without preview",
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
				desc = "[/] Fuzzily search in current buffer]",
			}
			-- stylua: ignore end
		},
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
	},
}
