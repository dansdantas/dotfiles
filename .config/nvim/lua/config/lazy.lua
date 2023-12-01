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
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	install = { 
		-- Do not automatically install on startup.
		missing = false,
		-- colorschemes to use during installation
		colorscheme = { "onedark", "tokyonight", "dawnfox", "habamax" }
	},

	-- Don't bother me when tweaking plugins.
	change_detection = { notify = false },

	ui = {
		size = { width = 1, height = 0.93 }, -- not full height, so search is visible
	},

	checker = {
		enabled = true, -- automatically check for plugin updates
		notify = false, -- done on my own to use minimum condition for less noise
		frequency = 60 * 60 * 24, -- = 1 day
	},

	diff = { cmd = "browser" }, -- view diffs with "d" in the browser

	performance = {
		rtp = {
			-- disable unused builtin plugins from neovim
			disabled_plugins = {
				"man",
				"matchparen",
				"matchit",
				"netrw",
				"netrwPlugin",
				"gzip",
				"zip",
				"tar",
				"tarPlugin",
				"tutor",
				"rplugin",
				"health",
				"tohtml",
				"zipPlugin",
			},
		},
	},
})
