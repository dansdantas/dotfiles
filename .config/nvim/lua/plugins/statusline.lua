local onedark = require("onedark.palette").darker
local colors = {
	bg = onedark.bg0,
	fg = onedark.fg,
	yellow = onedark.yellow,
	cyan = onedark.cyan,
	darkblue = onedark.dark_cyan,
	green = onedark.green,
	orange = onedark.orange,
	violet = onedark.dark_purple,
	magenta = onedark.purple,
	blue = onedark.blue,
	red = onedark.red,
}

return {
	{ "mhinz/vim-startify", cmd = { "SSave", "SLoad", "Startify" } },

	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
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

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
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
						diagnostics_color = {
							color_error = { fg = colors.red },
							color_warn = { fg = colors.yellow },
							color_info = { fg = colors.cyan },
						},
					},
				},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {
					{
						-- Lsp server name .
						function()
							local msg = "No Active Lsp"
							local buf_ft = vim.api.nvim_get_option_value("filetype", {})
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return msg
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									return client.name
								end
							end
							return msg
						end,
						icon = "  :",
						color = { fg = "#ffffff" },
					},
				},
				lualine_y = {},
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
		},
	},
}
