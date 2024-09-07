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
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
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
