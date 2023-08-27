require("bufferline").setup({
	options = {
		indicator = {
			style = "none",
		},
		tab_size = 10,
		diagnostics = "nvim_lsp",
		show_buffer_close_icons = false,
		separator_style = { "", "" },
	},
})
