local wezterm = require("wezterm")

local M = {}

function M.load()
	local theme_file = os.getenv("HOME") .. "/.config/omarchy/current/theme/wezterm.lua"
	local config = {}

	local f = io.open(theme_file, "r")
	if f ~= nil then
		f:close()
		local ok, theme = pcall(dofile, theme_file)
		if ok and type(theme) == "table" then
			for k, v in pairs(theme) do
				config[k] = v
			end
		elseif ok and type(theme) == "string" then
			config.color_scheme = theme
		else
			wezterm.log_warn("theme.lua did not return a valid color_scheme")
			config.color_scheme = "Tokyo Night Storm"
		end
	end

	return config
end

return M
