local function config()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
	local fb_actions = require("telescope").extensions.file_browser.actions
	local previewers = require("telescope.previewers")
	local Job = require("plenary.job")

	local _bad = { ".*%.csv" } -- Put all filetypes that slow you down in this array
	local bad_files = function(filepath)
		for _, v in ipairs(_bad) do
			if filepath:match(v) then
				return false
			end
		end

		return true
	end

	local new_maker = function(filepath, bufnr, opts)
		opts = opts or {}

		-- Remove highlighting on specific files
		if opts.use_ft_detect == nil then
			opts.use_ft_detect = true
		end
		opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)

		-- Do not preview on certain file size
		filepath = vim.fn.expand(filepath)
		vim.uv.fs_stat(filepath, function(_, stat)
			if not stat then
				return
			end
			if stat.size > 100000 then
				return
			end
		end)

		Job:new({
			command = "file",
			args = { "--mime-type", "-b", filepath },
			on_exit = function(j)
				local mime_type = vim.split(j:result()[1], "/")[1]
				-- If file is binary, do not attempt to preview
				if mime_type == "text" then
					previewers.buffer_previewer_maker(filepath, bufnr, opts)
				else
					-- maybe we want to write something to the buffer here
					vim.schedule(function()
						vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
					end)
				end
			end,
		}):sync()
	end

	telescope.setup({
		defaults = {
			buffer_previewer_maker = new_maker,
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

			file_previewer = previewers.vim_buffer_cat.new,
			grep_previewer = previewers.vim_buffer_vimgrep.new,
			qflist_previewer = previewers.vim_buffer_qflist.new,

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
}
