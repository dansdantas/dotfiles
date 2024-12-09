return {
	-- FZF
	{ "junegunn/fzf", build = "cd $XDG_DATA_HOME/fzf && ./install --xdg --no-update-rc" },

	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function() require("config.fzf") end,
	},
}
