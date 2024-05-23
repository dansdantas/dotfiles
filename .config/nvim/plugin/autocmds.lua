local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup
local opt_local = vim.opt_local

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
au("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = aug("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--------------------------------------------------------------------------------
-- FILETYPE

au("FileType", {
	pattern = "qf",
	callback = function()
		opt_local.buflisted = false
	end,
})

au("FileType", {
	pattern = { "lua" },
	callback = function()
		opt_local.list = false
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
	pattern = { "go", "lua", "rust", "sh" },
	callback = function()
		vim.bo.expandtab = false
	end,
})

--------------------------------------------------------------------------------
-- BUF

au({ "BufRead", "BufNewFile" }, {
	pattern = { "*.arb" },
	command = "setfiletype ruby",
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

--------------------------------------------------------------------------------
-- Docker compose tests

-- Define a flag to check if the autocommand has already run
local has_run_once = false

-- Define the function to check for the presence of docker-compose.yml
local function check_for_docker_compose()
	if not has_run_once then
		local root_dir = vim.fn.getcwd()

		local docker_compose_exists = vim.fn.filereadable(root_dir .. "/docker-compose.yml") == 1

		if docker_compose_exists then
			vim.g["test#ruby#rails#executable"] = "docker compose run -e RAILS_ENV=test app bundle exec rake test"
			vim.g["test#ruby#rspec#executable"] = "docker compose run -e RAILS_ENV=test app bundle exec rspec"
		end

		-- Set the flag to true to indicate that the autocommand has run
		has_run_once = true
	end
end

au({ "VimEnter", "BufEnter", "BufNewFile" }, {
	pattern = { "*.rb" },
	callback = check_for_docker_compose,
})

au({ "DirChanged" }, {
	pattern = { "*" },
	callback = function()
		has_run_once = false
	end,
})

--------------------------------------------------------------------------------
-- User commands - split if this keeps getting bigger
vim.api.nvim_create_user_command("SnipList", require("custom.utils").list_snips, {})
