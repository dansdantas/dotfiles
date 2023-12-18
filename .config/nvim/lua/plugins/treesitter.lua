--# selene: allow(mixed_table) -- lazy.nvim uses them
local languages = {
	"bash",
	"c",
	"comment",
	"cpp",
	"css",
	"dockerfile",
	"go",
	"graphql",
	"html",
	"http",
	"java",
	"javascript",
	"jsdoc",
	"json",
	"json5",
	"lua",
	"make",
	"markdown",
	"python",
	"r",
	"regex",
	"ruby",
	"rust",
	"scss",
	"terraform",
	"typescript",
	"vim",
	"vue",
	"yaml",
}

local options = {
	sync_install = false,
	ensure_installed = languages,

	highlight = {
		enable = true,
		disable = { "css" },
	},

	indent = { enable = true },

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<c-backspace>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
			-- You can choose the select mode (default is charwise 'v')
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * method: eg 'v' or 'o'
			-- and should return the mode ('v', 'V', or '<c-v>') or a table
			-- mapping query_strings to modes.
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding or succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * selection_mode: eg 'v'
			-- and should return true of false
			include_surrounding_whitespace = true,
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
	endwise = {
		enable = true,
	},
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = options,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-endwise",
			"nvim-treesitter/playground",
		},
	},

	{
		"Wansmer/treesj",
		keys = {
			-- stylua: ignore start
			{ "<space>st", function() require("treesj").toggle() end, desc = "" },
			{ "<space>sc", function() require("treesj").join() end, desc = "" },
			{ "<space>sp", function() require("treesj").split() end, desc = "" },
			-- stylua: ignore end
		},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			use_default_keymaps = false,
			max_join_length = 240,
		},
	},

	{
		"Wansmer/sibling-swap.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		keys = {
			-- stylua: ignore start
			{ "<space>sl", function() require("sibling-swap").swap_with_right() end, desc = "" },
			{ "<space>sh", function() require("sibling-swap").swap_with_left() end, desc = "" },
			-- stylua: ignore end
		},
		opts = { use_default_keymaps = false },
	},

	{
		"chrisgrieser/nvim-various-textobjs",
		lazy = false,
		opts = {
			useDefaultKeymaps = true,
			disabledKeymaps = { "gc", "in", "an", "il", "al" },
		},
		keys = {
			{
				"gx",
				function()
					-- select URL
					require("various-textobjs").url()

					-- plugin only switches to visual mode when textobj found
					local foundURL = vim.fn.mode():find("v")
					if not foundURL then
						return
					end

					-- retrieve URL with the z-register as intermediary
					vim.cmd.normal({ '"zy', bang = true })
					local url = vim.fn.getreg("z")

					-- open with the OS-specific shell command
					local opener
					if vim.fn.has("macunix") == 1 then
						opener = "open"
					elseif vim.fn.has("linux") == 1 then
						opener = "xdg-open"
					elseif vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 then
						opener = "start"
					end
					local openCommand = string.format("%s '%s' >/dev/null 2>&1", opener, url)
					vim.fn.system(openCommand)
				end,
				desc = "URL opener",
			},
			{
				"dsi",
				function()
					require("various-textobjs").indentation("outer", "outer")

					-- plugin only switches to visual mode when a textobj has been found
					local indentationFound = vim.fn.mode():find("V")
					if not indentationFound then
						return
					end

					-- dedent indentation
					vim.cmd.normal({ "<", bang = true })

					-- delete surrounding lines
					local endBorderLn = vim.api.nvim_buf_get_mark(0, ">")[1]
					local startBorderLn = vim.api.nvim_buf_get_mark(0, "<")[1]

					vim.cmd(tostring(endBorderLn) .. " delete") -- delete end first so line index is not shifted
					vim.cmd(tostring(startBorderLn) .. " delete")
				end,
				desc = "Delete surrounding indentation",
			},
		},
	},

	{ "nvim-treesitter/nvim-treesitter-textobjects", dependencies = { "nvim-treesitter/nvim-treesitter" } },
}
