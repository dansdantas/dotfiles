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
		pickers = {
			find_files = {
				find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
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
