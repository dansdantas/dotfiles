local gs = require("gitsigns")
gs.setup({
	numhl = true,
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

-- keymaps
local set = vim.keymap.set

set("n", "]g", function() gs.nav_hunk("next") end, { desc = "Git: next hunk" })
set("n", "[g", function() gs.nav_hunk("prev") end, { desc = "Git: previous hunk" })

set("n", "<leader>ga", function() gs.stage_hunk() end, { desc = "Git: add hunk" })
set("n", "<leader>gA", function() gs.stage_buffer() end, { desc = "Git: stage buffer" })
set("n", "<leader>gu", function() gs.undo_stage_hunk() end, { desc = "Git: unstage hunk" })
set("n", "<leader>gU", function() gs.reset_buffer_index() end, { desc = "Git: unstage buffer" })
set("n", "<leader>gR", function() gs.reset_buffer() end, { desc = "Git: reset buffer" })
set("n", "<leader>gr", function() gs.reset_hunk() end, { desc = "Git: reset hunk" })

set({ "o", "x" }, "ih", function() gs.select_hunk() end, { desc = "Git: hunk" })
set("n", ",gh", function() gs.select_hunk() end, { desc = "Git: select hunk" })

set("n", "<leader>gp", function() gs.preview_hunk() end, { desc = "Git: preview hunk" })
set("n", "<leader>gd", function() gs.diffthis() end, { desc = "Git: diff file" })
set("n", "<leader>gt", function() gs.toggle_deleted() end, { desc = "Git: toggle deleted hunks" })

set("n", "<leader>gq", function() gs.setqflist("all") end, { desc = "Git: populate hunks to loclist" })
set("n", "<leader>gb", function() gs.blame_line() end, { desc = "Git: blame line" })
set("n", "<leader>gB", function() gs.blame_line({ full = true }) end, { desc = "Git: blame full" })

set("n", "<leader>gs", function()
	local opts = {}

	-- Env variables GIT_WORK_TREE and GIT_DIR solves problems with not finding git still need conditional
	-- because of expanding files with -u tries to read every file on $HOME
	if vim.env.GIT_WORK_TREE == vim.env.HOME then
		opts.expand_dir = false
	end

	require("telescope.builtin").git_status(opts)
end, { desc = "Git: status" })

set("n", "<leader>gc", ":Git commit<cr>", { desc = "Git: commit" })
set("n", "<leader>g!", ":Git commit --amend<cr>", { desc = "Git: commit with amend" })

-- Tinygit
set("n", "<leader>gC", function() require("tinygit").smartCommit() end, { desc = "Git: commit" })
set("n", ",gp", function() require("tinygit").push({}) end, { desc = "Git: push" })
set("n", ",ga", function() require('tinygit"').amendOnlyMsg() end, { desc = "Git: amend only message" })
set("n", ",gA", ":Git add %<cr>", { desc = "Git: stage entire buffer" })

-- Gitlinker
set("n", ",gd", ":DiffviewFileHistory<CR>", { desc = "Show file history" })
set(
	"n",
	",gy",
	function()
		require("gitlinker").link({
			router_type = "default_branch",
		})
	end,
	{ silent = true, desc = "Copy link to file" }
)
set(
	"v",
	",gy",
	function()
		require("gitlinker").link({
			router_type = "default_branch",
		})
	end,
	{ silent = true, desc = "Copy link to file" }
)

set(
	"n",
	",gl",
	function()
		require("gitlinker").link({
			router_type = "default_branch",
			action = require("gitlinker.actions").system,
		})
	end,
	{ silent = true, desc = "Open file in browser" }
)

set(
	"v",
	",gl",
	function()
		require("gitlinker").link({
			router_type = "default_branch",
			action = require("gitlinker.actions").system,
		})
	end,
	{ silent = true, desc = "Open file in browser" }
)
