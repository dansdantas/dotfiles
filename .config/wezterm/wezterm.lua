local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Tokyo Night"
config.font = wezterm.font("Fantasque Sans Mono")
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_frame = {
  border_left_width = '0',
  border_right_width = '0',
  border_bottom_height = '0',
  border_top_height = '0',
}


local mux = wezterm.mux
wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
