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
	current_line_blame_opts = {
		delay = 300,
	},
})

-- keymaps
local set = vim.keymap.set

set("n", "]g", function()
	if vim.wo.diff then
		vim.cmd.normal({ "]c", bang = true })
	else
		gs.nav_hunk("next")
	end
end, { desc = "Git: next hunk" })

set("n", "[g", function()
	if vim.wo.diff then
		vim.cmd.normal({ "[c", bang = true })
	else
		gs.nav_hunk("prev")
	end
end, { desc = "Git: previous hunk" })

set("n", "<leader>ga", gs.stage_hunk, { desc = "Git: add hunk" })
set("n", "<leader>gA", gs.stage_buffer, { desc = "Git: stage buffer" })
set("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Git: unstage hunk" })
set("n", "<leader>gU", gs.reset_buffer_index, { desc = "Git: unstage buffer" })
set("n", "<leader>gR", gs.reset_buffer, { desc = "Git: reset buffer" })
set("n", "<leader>gr", gs.reset_hunk, { desc = "Git: reset hunk" })

set({ "o", "x" }, "ih", gs.select_hunk, { desc = "Git: hunk" })

set("n", "<leader>gp", gs.preview_hunk, { desc = "Git: preview hunk" })
set("n", "<leader>gt", gs.toggle_deleted, { desc = "Git: toggle deleted hunks" })

set("n", "<leader>gq", function() gs.setqflist("all") end, { desc = "Git: populate hunks to loclist" })
set("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Git: toggle current blame line" })
set("n", "<leader>gB", ":BlameToggle<cr>", { desc = "Git: blame line" })

set("n", "<leader>gc", ":Git commit<cr>", { desc = "Git: commit" })
set("n", "<leader>g!", ":Git commit --amend<cr>", { desc = "Git: commit with amend" })

-- Tinygit
set("n", "<leader>gC", function() require("tinygit").smartCommit() end, { desc = "Git: commit" })
set("n", ",gp", function() require("tinygit").push({}) end, { desc = "Git: push" })
set("n", ",ga", function() require('tinygit"').amendOnlyMsg() end, { desc = "Git: amend only message" })
set("n", ",gA", ":Git add %<cr>", { desc = "Git: stage entire buffer" })

-- Diffview
set("n", "<leader>gd", ":CodeDiff<CR>", { desc = "Git: show diff" })
set("n", "<leader>gx", ":CodeDiff close<CR>", { desc = "Git: close diff" })
set("n", ",gd", ":DiffviewOpen<CR>", { desc = "Git: show diff" })
set("n", ",gx", ":DiffviewClose<CR>", { desc = "Git: close diff" })
set("n", ",gh", ":DiffviewFileHistory<CR>", { desc = "Git: show file history" })

-- Git
local picker = Snacks.picker
set("n", "<leader>gl", picker.git_log, { desc = "Git: log" })
set("n", "<leader>gL", picker.git_log_line, { desc = "Git: log line" })
set("n", "<leader>gs", picker.git_status, { desc = "Git: status" })
set("n", ",gb", picker.git_branches, { desc = "Git: branches" })
-- set("n", ",gc", tlb.git_commits, { desc = "Git: commits" })
-- set("n", ",gC", tlb.git_bcommits, { desc = "Git: commits for current buffer" })

-- Gitlinker
set(
	{ "n", "v" },
	",gy",
	function()
		require("gitlinker").link({
			router_type = "default_branch",
		})
	end,
	{ silent = true, desc = "Copy link to file" }
)

set(
	{ "n", "v" },
	",gl",
	function()
		require("gitlinker").link({
			router_type = "default_branch",
			action = require("gitlinker.actions").system,
		})
	end,
	{ silent = true, desc = "Open file in browser" }
)
