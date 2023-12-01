local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup
local opt_local = vim.opt_local

--------------------------------------------------------------------------------
-- FILETYPE

au("FileType", {
	pattern = "qf",
	callback = function()
		vim.opt_local.buflisted = false
	end,
})

au("FileType", {
	pattern = { "lua" },
	callback = function()
		opt_local.path:append("./lua")
	end,
})

au("FileType", {
	group = aug("personal/close_with_q", { clear = true }),
	desc = "Close with <q>",
	pattern = {
		"help",
		"man",
		"qf",
		"query",
		"scratch",
		"spectre_panel",
	},
	callback = function(args)
		vim.keymap.set("n", "q", "<cmd>quit<cr>", { buffer = args.buf })
	end,
})

au("FileType", {
	pattern = { "go", "lua", "rust" },
	callback = function()
		vim.bo.expandtab = false
		vim.wo.list = false
	end,
})

--------------------------------------------------------------------------------
-- BUF

au({ "BufRead", "BufNewFile" }, {
	pattern = { "*.arb" },
	command = "setfiletype ruby",
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

-- no list chars in special buffers
au({ "BufNew", "BufReadPost" }, {
	callback = function()
		vim.defer_fn(function()
			if vim.bo.buftype ~= "" and vim.bo.ft ~= "query" then
				opt_local.list = false
			end
		end, 1)
	end,
})
