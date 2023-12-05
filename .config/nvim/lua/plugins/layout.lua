--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			messages = {
				enabled = false,
			},
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	-- Layout && Status
	{ "mhinz/vim-startify", cmd = { "SSave", "SLoad", "Startify" } },

	{
		"itchyny/vim-highlighturl",
		event = "VeryLazy",
		config = function()
			-- Disable the plugin in some places where the default highlighting
			-- is preferred.
			vim.api.nvim_create_autocmd("FileType", {
				desc = "Disable URL highlights",
				pattern = {
					"fzf",
					"lazyterm",
					"spectre_panel",
				},
				command = "call highlighturl#disable_local()",
			})
		end,
	},
}
