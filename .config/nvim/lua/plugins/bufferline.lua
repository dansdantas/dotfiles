--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		lazy = false,
		keys = {
			-- stylua: ignore start
			{ "<leader>j", function() require("bufferline").cycle(-1) end, desc = "previous buffer" },
			{ "<leader>J", function() require("bufferline").move(-1) end, desc = "move buffer backwards" },
			{ "<leader>k", function() require("bufferline").cycle(1) end, desc = "next buffer" },
			{ "<leader>K", function() require("bufferline").move(1) end, desc = "move buffer forwards" },
			{ "<leader>bf", function() require("bufferline").pick_buffer() end, desc = "select buffer" },
			-- stylua: ignore end
		},
		opts = {
			options = {
				indicator = {
					style = "none",
				},
				tab_size = 10,
				diagnostics = "nvim_lsp",
				show_buffer_close_icons = false,
				separator_style = { "", "" },
			},
		},
	},
}
