local M = {}

local g = vim.g

--------------------------------------------------------------------------------

---exported for remote control via hammerspoon
---@param mode "dark"|"light"
function M.setThemeMode(mode)
	vim.opt.background = mode
	g.neovide_transparency = mode == "dark" and g.darkOpacity or g.lightOpacity
	local targetTheme = mode == "dark" and g.darkTheme or g.lightTheme
	vim.cmd.highlight("clear") -- needs to be set before colorscheme https://github.com/folke/lazy.nvim/issues/40
	vim.cmd.colorscheme(targetTheme)
end

-- initialize theme on startup
M.setThemeMode("dark")

--------------------------------------------------------------------------------

return M
