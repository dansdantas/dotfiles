return {
	"markonm/traces.vim",

	{
		"kevinhwang91/nvim-hlslens",
		module = true,
		config = function()
			require("hlslens").setup({
				calm_down = true,
			})
		end,
	},

	-- Manipulate files
	"tpope/vim-eunuch", -- UNIX commands
	{ "stevearc/oil.nvim", opts = {} },

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "NvimTreeFindFile", "NvimTreeToggle" },
		main = "nvim-tree",
		opts = {
				sort_by = "case_sensitive",
				view = {
					adaptive_size = true,
				},
				renderer = {
					group_empty = true,
				},
		},
	},

	{
		"winston0410/range-highlight.nvim",
		opts = {},
		dependencies = {
			"winston0410/cmd-parser.nvim",
		},
	},
}
