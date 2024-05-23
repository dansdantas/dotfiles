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
set("n", "<leader>k", function() require("bufferline").cycle(1) end, { desc = "next buffer" })
set("n", "<leader>J", vim.cmd.tabprev, { desc = "prev tab" })
set("n", "<leader>K", vim.cmd.tabnext, { desc = "next tab" })
set("n", "<leader>bj", function() require("bufferline").move(-1) end, { desc = "move buffer backwards" })
set("n", "<leader>bk", function() require("bufferline").move(1) end, { desc = "move buffer forwards" })
set("n", "<leader>bf", function() require("bufferline").pick_buffer() end, { desc = "select buffer" })
