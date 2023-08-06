local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

au({ "BufRead", "BufNewFile" }, {
	pattern = { "*.arb" },
	command = "setfiletype ruby",
})

au("FileType", {
	pattern = "qf",
	callback = function()
		vim.opt_local.buflisted = false
	end,
})

au("FileType", {
	pattern = { "go", "lua" },
	callback = function()
		vim.bo.expandtab = false
		vim.wo.list = false
	end,
})

au("BufWritePre", {
	pattern = "NeogitCommitMessage",
	callback = function()
		print("called")
		vim.fn.system({ "touch", "~/.dotfiles.git/NEOGIT_COMMIT_EDITMSG" })
	end,
})

au({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
	group = aug("TS_FOLD_WORKAROUND", { clear = true }),
	callback = function()
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	end,
})
