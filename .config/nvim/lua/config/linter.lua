local M = {}

local slow_format_filetypes = {} -- Store slow formatters and remove from sync run
vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"

--------------------------------------------------------------------------------
--- Tools

vim.g.lspToMasonMap = {
	bashls = "bash-language-server", -- used for zsh
	biome = "biome", -- ts/js/json linter/formatter
	clangd = "clangd",
	cssls = "css-lsp",
	emmet_ls = "emmet-ls", -- css/html completion
	gopls = "gopls",
	html = "html-lsp",
	htmx = "htmx-lsp",
	jedi_language_server = "jedi_language_server",
	jsonls = "json-lsp",
	lua_ls = "lua-language-server",
	marksman = "marksman", -- markdown
	rust_analyzer = "rust_analyzer",
	solargraph = "solargraph",
	taplo = "taplo", -- toml
	tsserver = "typescript-language-server",
	vimls = "vimls",
	yamlls = "yaml-language-server",
	golangci_lint = "golangci-lint",
	jdtls = "jdtls",
	-- erb_format = "erb-formatter",
	-- erb_lint = "erb-lint",
}

local linters = {
	lua = { "selene" },
	sh = { "zsh" },
	markdown = { "markdownlint" },
	go = { "golangcilint", "revive" },
	-- eruby = { "erb_lint" },
	-- ruby = { "ruby", "rubocop" },
}

local formatters = {
	lua = { "stylua" },
	-- ruby = { "rubyfmt" },
	-- eruby = { "erb_format" },
	go = { "goimports", "gofmt" },
	javascript = { "biome", "prettierd" },
	typescript = { "biome" },
	json = { "biome" },
	markdown = { "markdown-toc", "markdownlint", "injected" },
	sh = { "shfmt" },
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
	local linterList = vim.iter(vim.tbl_values(myLinters)):flatten(math.huge):totable()
	local formatterList = vim.iter(vim.tbl_values(myFormatters)):flatten(math.huge):totable()
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
--- Keymaps

vim.keymap.set(
	"n",
	",f",
	function()
		require("conform").format({
			async = true,
			lsp_fallback = true,
			callback = vim.cmd.update,
		})
	end,
	{ desc = "Format: file" }
)

vim.keymap.set(
	{ "v" },
	",f",
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
	{ desc = "Format: range" }
)

vim.keymap.set("n", "<leader>mp", vim.cmd.MasonToolsUpdate, { desc = " Mason: Update" })

--------------------------------------------------------------------------------
--- User commands

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, { desc = "Disable autoformat-on-save", bang = true })

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, { desc = "Re-enable autoformat-on-save" })

--------------------------------------------------------------------------------

M.setup = function()
	require("mason").setup({ PATH = "append", ui = { check_outdated_packages_on_open = false } })
	require("mason-lspconfig").setup()

	-- Auto install tools
	local lsps = vim.tbl_values(vim.g.lspToMasonMap)
	local myTools = toolsToAutoinstall(linters, formatters, lsps, dontInstall)

	require("mason-tool-installer").setup({
		ensure_installed = myTools,
		run_on_start = false, -- manually, since otherwise not working with lazy-loading
	})
	vim.defer_fn(vim.cmd.MasonToolsInstall, 500)
	vim.defer_fn(vim.cmd.MasonToolsClean, 1000) -- delayed, so noice.nvim is loaded before

	-- Setup formatter
	require("conform").setup({
		formatters_by_ft = formatters,
		format_on_save = function(bufnr)
			-- Disable autoformat on certain filetypes
			local ignore_filetypes = { "ruby" }
			if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
				return false
			end
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return false
			end
			-- Disable autoformat for files in a certain path
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			if bufname:match("/node_modules/") then
				return false
			end

			-- Disable for slow formatters and also marks slow formatters on the fly
			if slow_format_filetypes[vim.bo[bufnr].filetype] then
				return false
			end
			local function on_format(err)
				if err and err:match("timeout$") then
					slow_format_filetypes[vim.bo[bufnr].filetype] = true
				end
			end
			-- ...additional logic...
			return { timeout_ms = 200, lsp_fallback = true }, on_format
		end,

		-- This runs on BufWritePost so it does not block further
		format_after_save = function(bufnr)
			if not slow_format_filetypes[vim.bo[bufnr].filetype] then
				return false
			end
			return { lsp_fallback = true }
		end,
	})

	-- Setup linter
	local lint = require("lint")
	lint.linters_by_ft = linters

	lint.linters.markdownlint.args = {
		"--disable=no-trailing-spaces", -- not disabled in config, so it's enabled for formatting
		"--disable=no-multiple-blanks",
	}

	lint.linters.selene.args = {
		"--display-style",
		"json",
		"--config",
		vim.env.XDG_CONFIG_HOME .. "/selene/selene.toml",
		"-",
	}

	local function doLint()
		if vim.bo.buftype ~= "" then
			return
		end
		require("lint").try_lint()
	end

	vim.api.nvim_create_autocmd({ "BufReadPost", "InsertLeave", "TextChanged", "FocusGained", "BufWritePost" }, {
		callback = doLint,
	})

	vim.api.nvim_create_user_command("Lint", doLint, {})

	doLint() -- run on initialization
end

return M
