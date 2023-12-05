--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	-- Commands
	{ "kylechui/nvim-surround", opts = {} },

	"tpope/vim-repeat",
	"tpope/vim-abolish", -- Search and replace subvert pattern
	"alvan/vim-closetag",
	"karb94/neoscroll.nvim",

	-- Motion
	"wellle/targets.vim",

	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").set_default_keymaps()
		end,
	},

	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>mt", ":MaximizerToggle<cr>", desc = "toggle maximize on current buffer" },
		},
	},
}
