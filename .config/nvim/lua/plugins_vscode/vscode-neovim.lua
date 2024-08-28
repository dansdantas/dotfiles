return {
	{
		"vscode-neovim/vscode-neovim",
		config = function(plugin) vim.opt.rtp:append(plugin.dir .. "/runtime") end,
	},
}
