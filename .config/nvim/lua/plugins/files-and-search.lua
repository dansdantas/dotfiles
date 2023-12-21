--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	-- Manipulate files
	"tpope/vim-eunuch", -- UNIX commands
	"markonm/traces.vim", -- substitute commands
	{ "stevearc/oil.nvim", opts = {} },
	{ "kevinhwang91/nvim-hlslens", opts = { calm_down = true } },

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
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
		keys = {
			{
				"<leader>F",
				function()
					require("nvim-tree.api").tree.toggle()
				end,
				desc = "NvimTree: toggle",
			},

			{
				"<leader>f",
				function()
					require("nvim-tree.api").tree.open({ find_file = true })
				end,
				desc = "NvimTree: find current file",
			},
		},
	},
}
