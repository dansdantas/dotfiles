require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " " },
			},
		},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = {
			-- wrap progress call to avoid problems with lazy load
			function() return require("lsp-progress").progress() end,

			{

				"filetype",
				icons_enabled = true,
				icon = { align = "left" },
				padding = 0,
				fmt = function(string, _) return " " .. string .. " " end,
			},
		},
		lualine_y = { "encoding" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
