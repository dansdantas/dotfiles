--# selene: allow(mixed_table) -- lazy.nvim uses them
--------------------------------------------------------------------------------
vim.g.lspToMasonMap = {
	ast_grep = "ast-grep", -- custom, ast-based linter
	bashls = "bash-language-server", -- used for zsh
	biome = "biome", -- ts/js/json linter/formatter
	clangd = "clangd",
	cssls = "css-lsp",
	emmet_ls = "emmet-ls", -- css/html completion
	gopls = "gopls",
	html = "html-lsp",
	jedi_language_server = "jedi_language_server",
	jsonls = "json-lsp",
	lua_ls = "lua-language-server",
	marksman = "marksman", -- markdown
	pyright = "pyright", -- python
	ruff_lsp = "ruff-lsp", -- python linter
	rust_analyzer = "rust_analyzer",
	solargraph = "solargraph",
	taplo = "taplo", -- toml
	tsserver = "typescript-language-server",
	vimls = "vimls",
	yamlls = "yaml-language-server",
	golangci_lint = "golangci-lint",
}

local linters = {
	lua = { "selene" },
	sh = { "zsh", "shellcheck" },
	markdown = { "markdownlint" },
	go = { "golangcilint" },
	-- ruby = { "ruby", "rubocop" },
}

local formatters = {
	lua = { "stylua" },
	-- ruby = { "rubyfmt" },
	go = { "goimports", "gofmt" },
	javascript = { "biome", { "prettierd", "prettier", "eslint_d" } },
	typescript = { "biome" },
	json = { "biome" },
	markdown = { "markdown-toc", "markdownlint", "injected" },
	sh = { "shellcheck", "shfmt" },
	["_"] = { "trim_whitespace", "trim_newlines", "squeeze_blanks" }, -- filetypes w/o formatter
}

local dontInstall = {
	-- builtin
	"zsh",
	"ruby",
	"gofmt",
	"golangcilint",

	-- not real formatters, but pseudo-formatters from conform.nvim
	"trim_whitespace",
	"trim_newlines",
	"squeeze_blanks",
	"injected",

	-- using rustup to maintain
	"rust_analyzer",
}

--------------------------------------------------------------------------------

---given the linter- and formatter-list of nvim-lint and conform.nvim, extract a
---list of all tools that need to be auto-installed
---@param myLinters table[]
---@param myFormatters table[]
---@param ignoreTools string[]
---@return string[] tools
---@nodiscard
local function toolsToAutoinstall(myLinters, myFormatters, myLsps, ignoreTools)
	-- get all linters, formatters, & extra tools and merge them into one list
	local linterList = vim.tbl_flatten(vim.tbl_values(myLinters))
	local formatterList = vim.tbl_flatten(vim.tbl_values(myFormatters))
	local tools = vim.list_extend(linterList, formatterList)
	vim.list_extend(tools, myLsps)

	-- only unique tools
	table.sort(tools)
	---@diagnostic disable-next-line: cast-local-type
	tools = vim.fn.uniq(tools)

	-- remove exceptions not to install
	tools = vim.tbl_filter(function(tool)
		return not vim.tbl_contains(ignoreTools, tool)
		---@diagnostic disable-next-line: param-type-mismatch
	end, tools)
	return tools
end

--------------------------------------------------------------------------------

local function linterConfigs()
	local lint = require("lint")
	lint.linters_by_ft = linters

	lint.linters.shellcheck.args = { "--shell=bash", "--format=json", "--external-sources", "-" }
	lint.linters.markdownlint.args = {
		"--disable=no-trailing-spaces", -- not disabled in config, so it's enabled for formatting
		"--disable=no-multiple-blanks",
	}
end

local function lintTriggers()
	local function doLint()
		if vim.bo.buftype ~= "" then
			return
		end
		require("lint").try_lint()
	end

	vim.api.nvim_create_autocmd({ "BufReadPost", "InsertLeave", "TextChanged", "FocusGained", "BufWritePost" }, {
		callback = doLint,
	})

	doLint() -- run on initialization
end

local formatterConfig = {
	formatters_by_ft = formatters,
}

--------------------------------------------------------------------------------

return {
	{ -- Linter integration
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			linterConfigs()
			lintTriggers()
		end,
	},
	{
		"stevearc/conform.nvim",
		keys = {
			{
				",f",
				function()
					require("conform").format({
						async = true,
						lsp_fallback = true,
						callback = vim.cmd.update,
					})
				end,
				desc = "format file",
			},
			{
				",f",
				mode = { "v" },
				desc = "Format range",
				function()
					require("conform").format({
						async = true,
						lsp_fallback = true,
						range = {
							start = vim.api.nvim_buf_get_mark(0, "<"),
							["end"] = vim.api.nvim_buf_get_mark(0, ">"),
						},
					})
				end,
			},
		},
		opts = formatterConfig,
	},

	-- bridge between tool installer and lspconfig
	{ "williamboman/mason-lspconfig.nvim", opts = {} },

	{ -- auto-install missing linters & formatters
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>pM", vim.cmd.MasonToolsUpdate, desc = " Mason Update" },
		},
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			opts = {
				PATH = "append",
				ui = {
					check_outdated_packages_on_open = false,
				},
			},
		},
		config = function()
			local lsps = vim.tbl_values(vim.g.lspToMasonMap)
			local myTools = toolsToAutoinstall(linters, formatters, lsps, dontInstall)

			require("mason-tool-installer").setup({
				ensure_installed = myTools,
				run_on_start = false, -- manually, since otherwise not working with lazy-loading
			})
			vim.defer_fn(vim.cmd.MasonToolsInstall, 500)
			vim.defer_fn(vim.cmd.MasonToolsClean, 1000) -- delayed, so noice.nvim is loaded before
		end,
	},
}
