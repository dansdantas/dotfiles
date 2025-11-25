local tl = require("telescope")
local themes = require("telescope.themes")
local actions = require("telescope.actions")
local layout = require("telescope.actions.layout")
local fb_actions = require("telescope").extensions.file_browser.actions
local lga_actions = require("telescope-live-grep-args.actions")

local toggle_dark_mode = function()
	local mode = { ["light"] = "dark", ["dark"] = "light" }
	---@diagnostic disable-next-line: undefined-field
	vim.opt.background = mode[vim.opt.background:get()]
end

tl.setup({
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
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-f>"] = actions.preview_scrolling_down,
				["<C-b>"] = actions.preview_scrolling_up,
				["<Esc>"] = actions.close,
				["<C-r>"] = actions.select_all,
				["<A-t>"] = layout.toggle_preview,
				["<C-Space>"] = actions.to_fuzzy_refine,
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
		git_status = {
			layout_config = {
				preview_width = 0.6,
			},
		},

		colorscheme = {
			enable_preview = true,
			mappings = {
				i = { ["<c-t>"] = toggle_dark_mode },
				n = { ["<c-t>"] = toggle_dark_mode },
			},
		},
	},

	extensions = {
		["ui-select"] = { themes.get_dropdown({}) },

		file_browser = {
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = { ["<C-w>"] = function() vim.cmd("normal vbd") end },
				["n"] = {
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function() vim.cmd("startinsert") end,
				},
			},
		},

		lazy_plugins = {
			picker_opts = {
				sorting_strategy = "descending",
			},
		},

		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			mappings = {
				i = {
					["<C-k>"] = lga_actions.quote_prompt(),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
				},
			},
		},

		smart_open = {
			show_scores = true,
		},
	},
})

-- Enable extensions if they are installed
pcall(tl.load_extension, "ui-select")
pcall(tl.load_extension, "file_browser")
pcall(tl.load_extension, "fzf")
pcall(tl.load_extension, "live_grep_args")
pcall(tl.load_extension, "lazy_plugins")
pcall(tl.load_extension, "smart_open")

-- keymaps
local set = vim.keymap.set
local tlb = require("telescope.builtin")
local extensions = tl.extensions
-- local ivy = themes.get_ivy({ winblend = 10, previewer = true })

-- files
-- set("n", "<C-p>", function() tlb.git_files(ivy) end, { desc = "Telescope: project files" })
-- set("n", "<leader>o", tlb.find_files, { desc = "Telescope: files" })
set("n", "<leader>tf", function() tlb.find_files({ previewer = false }) end, { desc = "Telescope: wo preview" })
-- set("n", "<leader>tn", function() tlb.find_files({ cwd = vim.fn.stdpath("config"), prompt_title = "Neovim" }) end)
-- set("n", "<leader>td", require("custom.utils").search_dotfiles, { desc = "Telescope: dotfiles" })

-- set("n", "<leader><leader>", tlb.buffers, { desc = "Telescope: buffers" })
-- set("n", "<leader>/", function() tlb.current_buffer_fuzzy_find() end, { desc = "Telescope: fuzzy buffer" })

-- set("n", "<leader>t?", tlb.oldfiles, { desc = "Telescope: recent files" })
-- set("n", "<leader>tq", tlb.quickfix, { desc = "Telescope: quickfix entries" })
-- set("n", "<leader>tr", tlb.resume, { desc = "Telescope: resume" })

-- Grep
-- set("n", "<leader>tw", tlb.grep_string, { desc = "Telescope: find word" })
set("n", "<leader>tG", extensions.live_grep_args.live_grep_args, { desc = "Telescope: grep with args" })
-- set("n", "<leader>tg", tlb.live_grep, { desc = "Telescope: grep" })
-- set("n", "<leader>sn", function() tlb.live_grep({ cwd = vim.fn.stdpath("config"), prompt_title = "Neovim" }) end)

-- set(
-- 	"n",
-- 	"<leader>sf",
-- 	function() tlb.live_grep({ grep_open_files = true, prompt_title = "Grep on open files" }) end,
-- 	{ desc = "Telescope: grep on open files" }
-- )

-- set(
-- 	"n",
-- 	"<leader>ts",
-- 	function() tlb.grep_string({ search = [[TODO:|todo!\(.*\)]] }) end,
-- 	{ desc = "Telescope: grep todos" }
-- )

-- extensions and helpers
-- set("n", "<leader>tc", tlb.colorscheme, { desc = "Telescope: colors" })
-- set("n", "<leader>tl", extensions.lazy_plugins.lazy_plugins, { desc = "Telescope: lazy plugins" })
-- set("n", "<leader>te", extensions.smart_open.smart_open, { desc = "Telescope: smart open" })

set(
	"n",
	"<leader>tb",
	function()
		extensions.file_browser.file_browser({
			path = "%:p:h",
			hidden = true,
			grouped = true,
		})
	end,
	{ desc = "Telescope: file browser" }
)

-- Vim
-- set("n", "<leader>vC", tlb.command_history, { desc = "Vim: command history" })
-- set("n", "<leader>c", tlb.command_history, { desc = "Vim: command history" })
-- set("n", "<leader>vc", tlb.commands, { desc = "Vim: commands" })
-- set("n", "<leader>vh", tlb.help_tags, { desc = "Vim: help" })
-- set("n", "<leader>vd", tlb.diagnostics, { desc = "Vim: diagnostics" })
-- set("n", "<leader>vk", tlb.keymaps, { desc = "Vim: keymaps" })
set("n", "<leader>vo", tlb.vim_options, { desc = "Vim: options" })
-- set("n", "<leader>va", tlb.autocommands, { desc = "Vim: autocommands" })

-- Git
-- set("n", ",gb", tlb.git_branches, { desc = "Git: branches" })
set("n", ",gc", tlb.git_commits, { desc = "Git: commits" })
set("n", ",gC", tlb.git_bcommits, { desc = "Git: commits for current buffer" })
