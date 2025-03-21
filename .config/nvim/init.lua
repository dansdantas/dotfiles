if vim.loader then
	vim.loader.enable()
end

-- Globals
P = require("custom.utils").print
R = require("custom.utils").reload

-- Leader should be defined before everything is configured
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap Lazy.nvim plugin manager https://github.com/folke/lazy.nvim#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

-- Add lazy to the 'runtimepath', this allow us to 'require' it.
vim.opt.rtp:prepend(lazypath)

-- Start lazy
-- Split config between plugins that does not play well with vscode so at least integration works
require("lazy").setup({
	{ import = "plugins", cond = true },
	{ import = "plugins_vscode", cond = function() return vim.g.vscode end },
	{ import = "plugins_not_vscode", cond = function() return not vim.g.vscode end },
}, require("config.lazy"))
