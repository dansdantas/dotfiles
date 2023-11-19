if vim.loader then
	vim.loader.enable()
end

P = function(v)
	print(vim.inspect(v))
	return v
end

function table.copy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == "table" then
		copy = {}
		for orig_key, orig_value in pairs(orig) do
			copy[orig_key] = orig_value
		end
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

function table.merge(t1, t2)
	for k, v in pairs(t2) do
		if type(v) == "table" then
			if type(t1[k] or false) == "table" then
				table.merge(t1[k] or {}, t2[k] or {})
			else
				t1[k] = v
			end
		else
			t1[k] = v
		end
	end
	return t1
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("settings")
require("commands")
require("plugins")
require("ls")

require("plugins.settings")
require("statusline")
require("plugins.mason")
require("lsp")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.cmp")
require("plugins.which_key")
require("plugins.null-ls")
require("plugins.dap")
