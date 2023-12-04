--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	{ "mhinz/vim-startify", cmd = { "SSave", "SLoad", "Startify" } },

	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		lazy = false,
		keys = {
			{ "<leader>j", function() require("bufferline").cycle(-1) end, desc = "previous buffer"},
			{ "<leader>J", function() require("bufferline").move(-1) end, desc = "move buffer backwards"},
			{ "<leader>k", function() require("bufferline").cycle(1) end, desc = "next buffer"},
			{ "<leader>K", function() require("bufferline").move(1) end, desc = "move buffer forwards"},
			{ "<leader>bf", function() require("bufferline").pick_buffer() end, desc = "select buffer"},
			{ "<leader>bp", function() require("bufferline").toggle_pin() end, desc = "toggle pin"},
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
					},
				},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},

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
