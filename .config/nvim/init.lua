if vim.loader then
	vim.loader.enable()
end

local utils = require('config.utils')

-- Globals
P = utils.print
table.copy = utils.table_copy
table.merge = utils.table_merge

-- Leader should be defined before everything is configured
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
