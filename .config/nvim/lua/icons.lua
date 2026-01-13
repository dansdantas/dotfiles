local M = {}

--- Diagnostic severities.
M.diagnostics = {
	ERROR = "",
	WARN = "",
	HINT = "",
	INFO = "",
}

--- For folding.
M.arrows = {
	right = "",
	left = "",
	up = "",
	down = "",
}

--- LSP symbol kinds.
M.symbol_kinds = {
	Array = "󰅪",
	BladeNav = "",
	Boolean = "",
	Calendar = "",
	Class = "",
	Codeium = "",
	Color = "󰏘",
	Constant = "󰏿",
	Constructor = "",
	Copilot = "",
	Enum = "",
	EnumMember = "",
	Event = "",
	Field = "󰜢",
	File = "󰈙",
	Folder = "󰉋",
	Function = "󰆧",
	Interface = "",
	Keyword = "󰌋",
	Method = "󰆧",
	Module = "",
	Namespace = "󰌗",
	Null = "󰟢",
	Number = "",
	Object = "󰅩",
	Operator = "󰆕",
	Package = "",
	Property = "󰜢",
	Reference = "󰈇",
	Snippet = "",
	String = "󰉿",
	Struct = "󰙅",
	Supermaven = "",
	TabNine = "",
	Table = "",
	Tag = "",
	Text = "",
	TypeParameter = "",
	Unit = "",
	Value = "",
	Variable = "󰀫",
	Watch = "󰥔",
}

--- Shared icons that don't really fit into a category.
M.misc = {
	bug = "",
	ellipsis = "…",
	git = "",
	search = "",
	vertical_bar = "│",
}

return M
