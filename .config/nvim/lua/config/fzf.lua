local actions = require("fzf-lua.actions")
local fzf = require("fzf-lua")

fzf.setup({
	grep = {
		RIPGREP_CONFIG_PATH = vim.env.RIPGREP_CONFIG_PATH,
	},
	winopts = {
		height = 0.9,
		width = 0.9,
		-- preview = { default = "bat" },
		-- row = 1,
		-- col = 1,
	},
	fzf_opts = { ["--layout"] = "reverse-list" },
	fzf_colors = {
		fg = { "fg", { "Normal" } },
		bg = { "bg", { "Normal" } },
		hl = { "fg", { "Comment" } },
		info = { "fg", { "PreProc" } },
		border = { "fg", { "Ignore" } },
		prompt = { "fg", { "Conditional" } },
		pointer = { "fg", { "Exception" } },
		marker = { "fg", { "Keyword" } },
		spinner = { "fg", { "Label" } },
		header = { "fg", { "Comment" } },
		["fg+"] = { "fg", { "CursorLine", "CursorColumn", "Normal" } },
		["bg+"] = { "bg", { "CursorLine", "CursorColumn" } },
		["hl+"] = { "fg", { "Statement" } },
	},
	files = {
		git_icons = false,
		file_icons = false,
	},
	actions = {
		git_status = {
			["tab"] = { actions.git_stage_unstage, reload = true },
			["ctrl-h"] = { actions.git_stage, reload = true },
			["ctrl-l"] = { actions.git_unstage, reload = true },
		},
		files = {
			["default"] = actions.file_edit,
			["ctrl-x"] = actions.file_split,
			["ctrl-v"] = actions.file_vsplit,
			["ctrl-t"] = actions.file_tabedit,
			["ctrl-q"] = actions.file_set_to_qf,
		},
	},
	buffers = {
		actions = {
			["ctrl-x"] = actions.file_split,
			["ctrl-q"] = { fn = actions.buf_del, reload = true },
		},
	},
	keymap = {
		builtin = {
			["<C-b>"] = "preview-page-up",
			["<C-f>"] = "preview-page-down",
		},
		fzf = {
			["ctrl-d"] = "half-page-down",
			["ctrl-u"] = "half-page-up",
			["ctrl-b"] = "preview-page-up",
			["ctrl-f"] = "preview-page-down",
		},
	},
})

-- What is missing?
-- grep on open files - could not find, maybe documentation?
-- replacemente for greping on lazy plugins - need write own function
-- different layouts for some finders - not extensible

if false then
	-- keymaps
	local set = vim.keymap.set

	set("n", "<C-p>", fzf.git_files, { desc = "FZF: project files" })
	set("n", "<leader>o", fzf.files, { desc = "FZF: files" })
	set(
		"n",
		"<leader>tf",
		function() fzf.files({ winopts = { preview = { hidden = "hidden" } } }) end,
		{ desc = "FZF: wo preview" }
	)
	set("n", "<leader>tn", function() fzf.files({ prompt = "Neovim", cwd = vim.fn.stdpath("config") }) end)

	set(
		"n",
		"<leader>td",
		function()
			fzf.files({
				prompt = "dotfiles > ",
				cwd = "$HOME/dotfiles",
				cwd_prompt = false,
			})
		end,
		{ desc = "FZF: dotfiles" }
	)

	set("n", "<leader><leader>", fzf.buffers, { desc = "FZF: buffers" })
	set("n", "<leader>/", fzf.blines, { desc = "FZF: fuzzy buffer" })
	set("n", "<leader>t?", fzf.oldfiles, { desc = "FZF: recent files" })
	set("n", "<leader>tq", fzf.quickfix, { desc = "FZF: quickfix entries" })
	set("n", "<leader>tr", fzf.resume, { desc = "FZF: resume" })

	-- Grep
	set("n", "<leader>tw", fzf.grep_cword, { desc = "FZF: find word" })
	-- set("n", "<leader>tG", extensions.egrepify.egrepify, { desc = "FZF: egrepify" })
	set("n", "<leader>tg", fzf.live_grep, { desc = "FZF: grep" })
	set("n", "<leader>sn", function() fzf.live_grep({ cwd = vim.fn.stdpath("config"), prompt_title = "Neovim" }) end)

	-- set("n", "<leader>sf", fzf.live_grep, { desc = "FZF: grep on open files" })

	set("n", "<leader>ts", function() fzf.grep({ search = [[TODO:|todo!\(.*\)]] }) end, { desc = "FZF: grep todos" })

	-- -- extensions and helpers
	set("n", "<leader>tc", fzf.colorschemes, { desc = "FZF: colors" })

	-- set("n", "<leader>tl", function() extensions.lazy_plugins.lazy_plugins({}) end, { desc = "FZF: lazy plugins" })

	-- set(
	-- 	"n",
	-- 	"<leader>tb",
	-- 	function()
	-- 		extensions.file_browser.file_browser({
	-- 			path = "%:p:h",
	-- 			hidden = true,
	-- 			grouped = true,
	-- 		})
	-- 	end,
	-- 	{ desc = "FZF: file browser" }
	-- )

	-- Vim
	set("n", "<leader>vC", fzf.command_history, { desc = "Vim: command history" })
	set("n", "<leader>vc", fzf.commands, { desc = "Vim: commands" })
	set("n", "<leader>vh", fzf.helptags, { desc = "Vim: help" })
	set("n", "<leader>vd", fzf.diagnostics_workspace, { desc = "Vim: diagnostics" })
	set("n", "<leader>vk", fzf.keymaps, { desc = "Vim: keymaps" })
	-- set("n", "<leader>vo", function() tlb.vim_options() end, { desc = "Vim: options" })
	set("n", "<leader>va", fzf.autocmds, { desc = "Vim: autocommands" })

	-- Git
	set("n", ",gb", fzf.git_branches, { desc = "Git: branches" })
	set("n", ",gc", fzf.git_commits, { desc = "Git: commits" })
	set("n", ",gC", fzf.git_bcommits, { desc = "Git: commits for current buffer" })
	set("n", "<leader>gs", fzf.git_status, { desc = "Git: status" })
end
