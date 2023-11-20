if vim.loader then
	vim.loader.enable()
end

local utils = require("config.utils")

-- Globals
P = utils.print

-- Leader should be defined before everything is configured
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------------------------------------------------------------------------

---Try to require the module, and do not error out when one of them cannot be
---loaded, but do notify if there was an error.
---@param module string module to load
local function safeRequire(module)
	local success, result = pcall(require, module)
	if success then
		return
	end
	vim.defer_fn( -- defer so notification plugins are loaded before
		function()
			vim.notify(("Error loading %s\n%s"):format(module, result), vim.log.levels.ERROR)
		end,
		1
	)
end

safeRequire("config.lazy")
safeRequire("config.options")
safeRequire("config.autocmds")
safeRequire("config.snippets")
