vim.keymap.set("n", "<leader>la", ":Lazy<cr>", { desc = "Lazy plugins" })

return {
	install = {
		-- Do not automatically install on startup.
		missing = false,

		-- colorschemes to use during installation
		colorscheme = { "tokyonight", "dawnfox", "habamax" },
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
				"gzip",
				"health",
				"man",
				"matchit",
				"matchparen",
				"netrw",
				"netrwPlugin",
				"rplugin",
				"tar",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zip",
				"zipPlugin",
			},
		},
	},
}
