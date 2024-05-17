--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	-- Manipulate files
	"tpope/vim-eunuch", -- UNIX commands
	"markonm/traces.vim",
	{ "kevinhwang91/nvim-hlslens", opts = { calm_down = true } },

	{
		"stevearc/oil.nvim",
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
		config = function(_, opts)
			require("oil").setup(opts)

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", {})
		end,
	},

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
