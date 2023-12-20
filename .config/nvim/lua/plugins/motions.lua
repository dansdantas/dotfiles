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
		"szw/vim-maximizer",
		keys = {
			{ "<leader>mt", ":MaximizerToggle<cr>", desc = "toggle maximize on current buffer" },
		},
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			search = {
				mode = "fuzzy",
				incremental = true,
			},
			modes = {
				char = { enabled = false },
				search = { enabled = false },
			},
			prompt = {
				enabled = false,
			},
		},
		keys = {
			-- stylua: ignore start
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash search", },
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash", },
			-- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter", },
			-- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash", },
			-- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search", },
			-- stylua: ignore end
		},
	},
}
