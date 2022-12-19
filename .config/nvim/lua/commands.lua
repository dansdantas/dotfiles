local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

au("FileType", {
	pattern = "vue",
	command = "syntax sync fromstart",
})

au({ "BufRead", "BufNewFile" }, {
	pattern = { "*.arb" },
	command = "setfiletype ruby",
})

au({ "BufWritePost" }, {
	group = aug("PackerUserConfig", { clear = true }),
	pattern = { "plugins.lua" },
	command = "source <afile> | PackerCompile",
})

au("FileType", {
	pattern = "qf",
	callback = function()
		vim.opt_local.buflisted = false
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
		vim.opt.foldlevel = 9999
	end,
})
