--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	-- Syntax
	{
		"ckolkey/ts-node-action",
		dependencies = { "nvim-treesitter" },
		opts = {},
		keys = {
			-- stylua: ignore start
			{ "<c-c>", function() require("ts-node-action").node_action() end, desc = "TS: node action" },
			-- stylua: ignore end
		},
	},

	{ "numToStr/Comment.nvim", opts = { ignore = "^$" } },

	-- Languages
	-- "mattn/emmet-vim",
	"andymass/vim-matchup",
	"milisims/nvim-luaref",
	--  'tpope/vim-rails'
	--  'vim-ruby/vim-ruby'

	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua", -- recommanded if need floating window support,
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-telescope/telescope-dap.nvim",
		},
		opts = {
			luasnip = true,
			lsp_inlay_hints = { enable = false },
		},
		init = function()
			vim.keymap.set("n", ",fs", ":GoFillStruct<cr>", { desc = "GO: fill struct" })
			vim.keymap.set("n", ",fw", ":GoFillSwitch<cr>", { desc = "GO: fill switch" })
		end,
	},

	{
		"nat-418/boole.nvim",
		keys = {
			{ "+", "<C-a>" },
			{ "-", "<C-x>" },
		},
		opts = {
			mappings = {
				increment = "<C-a>",
				decrement = "<C-x>",
			},
			additions = {
				{ "true", "false" },
			},
		},
	},
}
