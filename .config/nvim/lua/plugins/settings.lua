local env = vim.env
local g = vim.g
local fn = vim.fn

-- AnyJump
g.any_jump_disable_default_keybindings = 1

-- FZF
env.FZF_DEFAULT_COMMAND = "rg --hidden --files -g '' 2>/dev/null"

-- Center window
g.fzf_layout = { down = "40%", window = { width = 0.9, height = 0.6 } }

g.fzf_colors = {
	fg = { "fg", "Normal" },
	bg = { "bg", "Normal" },
	hl = { "fg", "Comment" },
	info = { "fg", "PreProc" },
	border = { "fg", "Ignore" },
	prompt = { "fg", "Conditional" },
	pointer = { "fg", "Exception" },
	marker = { "fg", "Keyword" },
	spinner = { "fg", "Label" },
	header = { "fg", "Comment" },
	["fg+"] = { "fg", "CursorLine", "CursorColumn", "Normal" },
	["bg+"] = { "bg", "CursorLine", "CursorColumn" },
	["hl+"] = { "fg", "Statement" },
}

local build_quickfix_list = function(lines)
	local files = {}

	for _, file in pairs(lines) do
		table.insert(files, { filename = file })
	end

	fn.setqflist(files)
	vim.cmd(":copen")
end

g.fzf_action = {
	["ctrl-t"] = "tab split",
	["ctrl-x"] = "split",
	["ctrl-v"] = "vsplit",
	["ctrl-q"] = build_quickfix_list,
}

-- Test
g["test#strategy"] = "floaterm"
g["test#preserve_screen"] = 1
g["test#echo_command"] = 0
g["test#neovim#term_position"] = "vert botright 50"
