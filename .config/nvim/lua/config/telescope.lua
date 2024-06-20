local tl = require("telescope")
local themes = require("telescope.themes")
local actions = require("telescope.actions")
local layout = require("telescope.actions.layout")
local fb_actions = require("telescope").extensions.file_browser.actions

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
	},
})

-- Enable extensions if they are installed
pcall(tl.load_extension, "ui-select")
pcall(tl.load_extension, "file_browser")
pcall(tl.load_extension, "fzf")
pcall(tl.load_extension, "egrepify")
pcall(tl.load_extension, "lazy_plugins")

-- keymaps
local set = vim.keymap.set
local tlb = require("telescope.builtin")
local extensions = tl.extensions
local ivy = themes.get_ivy({ winblend = 10, previewer = true })
local dropdown = themes.get_dropdown({ winblend = 10, previewer = false })

-- files
set("n", "<C-p>", function() tlb.git_files(ivy) end, { desc = "Telescope: project files" })
set("n", "<leader>o", function() tlb.find_files() end, { desc = "Telescope: files" })
set("n", "<leader>tf", function() tlb.find_files({ previewer = false }) end, { desc = "Telescope: wo preview" })
set("n", "<leader>tn", function() tlb.find_files({ cwd = vim.fn.stdpath("config"), prompt_title = "Neovim" }) end)
set("n", "<leader>td", function() require("custom.utils").search_dotfiles() end, { desc = "Telescope: dotfiles" })

set("n", "<leader><leader>", function() tlb.buffers() end, { desc = "Telescope: buffers" })
set("n", "<leader>/", function() tlb.current_buffer_fuzzy_find(dropdown) end, { desc = "Telescope: fuzzy buffer" })

set("n", "<leader>t?", function() tlb.oldfiles() end, { desc = "Telescope: recent files" })
set("n", "<leader>tq", function() tlb.quickfix() end, { desc = "Telescope: quickfix entries" })
set("n", "<leader>tr", function() tlb.resume() end, { desc = "Telescope: resume" })

-- Grep
set("n", "<leader>tw", function() tlb.grep_string() end, { desc = "Telescope: find word" })
set("n", "<leader>tG", function() extensions.egrepify.egrepify({}) end, { desc = "Telescope: egrepify" })
set("n", "<leader>tg", function() tlb.live_grep() end, { desc = "Telescope: grep" })
set("n", "<leader>sn", function() tlb.live_grep({ cwd = vim.fn.stdpath("config"), prompt_title = "Neovim" }) end)

set(
	"n",
	"<leader>sf",
	function() tlb.live_grep({ grep_open_files = true }) end,
	{ desc = "Telescope: grep on open files" }
)

set(
	"n",
	"<leader>ts",
	function() tlb.grep_string({ search = [[TODO:|todo!\(.*\)]] }) end,
	{ desc = "Telescope: grep todos" }
)

-- extensions and helpers
set("n", "<leader>tc", function() tlb.colorscheme() end, { desc = "Telescope: colors" })

set("n", "<leader>tl", function() extensions.lazy_plugins.lazy_plugins({}) end, { desc = "Telescope: lazy plugins" })

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
set("n", "<leader>vC", function() tlb.command_history() end, { desc = "Vim: command history" })
set("n", "<leader>vc", function() tlb.commands() end, { desc = "Vim: commands" })
set("n", "<leader>vh", function() tlb.help_tags() end, { desc = "Vim: help" })
set("n", "<leader>vd", function() tlb.diagnostics() end, { desc = "Vim: diagnostics" })
set("n", "<leader>vk", function() tlb.keymaps() end, { desc = "Vim: keymaps" })
set("n", "<leader>vo", function() tlb.vim_options() end, { desc = "Vim: options" })
set("n", "<leader>va", function() tlb.autocommands() end, { desc = "Vim: autocommands" })

-- Git
set("n", ",gb", function() tlb.git_branches() end, { desc = "Git: branches" })
set("n", ",gc", function() tlb.git_commits() end, { desc = "Git: commits" })
set("n", ",gC", function() tlb.git_bcommits() end, { desc = "Git: commits for current buffer" })
