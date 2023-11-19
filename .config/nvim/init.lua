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

require("config.lazy")

require("settings")
require("commands")
require("ls")
require("statusline")
require("lsp")
