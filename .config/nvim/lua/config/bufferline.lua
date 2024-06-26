local bufferline = require("bufferline")
bufferline.setup({
	options = {
		indicator = {
			style = "none",
		},
		tab_size = 0,
		diagnostics = "nvim_lsp",
		show_buffer_close_icons = false,
		separator_style = {},
		offsets = {
			{
				filetype = "NvimTree",
				text = "Tree",
				text_align = "center",
				separator = false,
			},
		},
	},
})

-- keymaps
local set = vim.keymap.set

set("n", "<leader>j", function() bufferline.cycle(-1) end, { desc = "previous buffer" })
set("n", "<leader>k", function() bufferline.cycle(1) end, { desc = "next buffer" })
set("n", "<leader>bj", function() bufferline.move(-1) end, { desc = "move buffer backwards" })
set("n", "<leader>bk", function() bufferline.move(1) end, { desc = "move buffer forwards" })
