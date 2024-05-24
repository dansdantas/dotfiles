return {
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
			{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Flash: search" },
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash: jump" },
		-- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter", },
		-- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash", },
		-- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search", },
		-- stylua: ignore end
	},
}
