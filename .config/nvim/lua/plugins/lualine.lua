--# selene: allow(mixed_table) -- lazy.nvim uses them
local lsp_status_line = {
	function()
		local msg = "No Active Lsp"
		local clients = vim.lsp.get_clients({ bufnr = 0 })

		if next(clients) == nil then
			return msg
		end

		-- Deal with multiple clients?
		return clients[1].name
	end,
	icon = "  :",
	color = { fg = "#ffffff" },
	on_click = function()
		local clients = vim.lsp.get_clients({ bufnr = 0 })

		if next(clients) == nil then
			return P("no clients active")
		end

		local selected = {}

		for _, client in ipairs(clients) do
			table.insert(selected, client.name)
		end

		P(selected)
	end,
}

return {
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
						"filetype",
						icons_enabled = true,
						icon = { align = "left" },
						padding = 0,
						fmt = function(string, _)
							return " " .. string
						end,
					},

					lsp_status_line,
				},
				lualine_y = { "encoding" },
				lualine_z = {
					"location",
				},
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
