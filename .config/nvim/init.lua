if vim.loader then
	vim.loader.enable()
end

-- Globals
P = require("config.utils").print

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
require("lazy").setup("plugins", require("config.lazy"))
