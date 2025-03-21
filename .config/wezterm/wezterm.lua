local wezterm = require("wezterm")
local action = wezterm.action
local callback = wezterm.action_callback

--------------------------------------------------------------------------------
-- Events
local mux = wezterm.mux
wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

--------------------------------------------------------------------------------
-- Options
local config = wezterm.config_builder()
local font = wezterm.font_with_fallback({
	{ family = "Fantasque Sans Mono", harfbuzz_features = { "ss01=1" } },
	"JetBrains Mono",
	"Symbols Nerd Font Mono",
	"Noto Color Emoji",
})

local is_linux = wezterm.target_triple == "x86_64-unknown-linux-gnu"

config.color_scheme = "Tokyo Night"
-- only if want to match line height on kitty
-- config.font_size = 10
if not is_linux then
	config.line_height = 0.90
end
config.font = font
config.default_workspace = "dot"
config.check_for_updates = false

-- Mirror scrollback line from tmux
config.scrollback_lines = 1024000

-- Tab bar
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}

-- Fullscreen
config.window_decorations = "RESIZE"
config.native_macos_fullscreen_mode = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_frame = {
	border_left_width = "0",
	border_right_width = "0",
	border_bottom_height = "0",
	border_top_height = "0",
	font = font,
}

local super_key = is_linux and "SUPER" or "CMD"

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 5000 }
config.keys = {
	{ key = "R", mods = "LEADER", action = action.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },

	--------------------------------------------------------------------------------
	-- Callbacks
	{
		key = "g",
		mods = "LEADER",
		action = callback(function(window, _, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.enable_tab_bar == nil then
				overrides.enable_tab_bar = true
			else
				overrides.enable_tab_bar = not overrides.enable_tab_bar
			end
			window:set_config_overrides(overrides)
		end),
	},

	{ key = "m", mods = "LEADER", action = callback(function(window, _, _) window:maximize() end) },
	{ key = "r", mods = "LEADER", action = callback(function(window, _, _) window:restore() end) },

	--------------------------------------------------------------------------------
	-- Panes
	{ key = "{", mods = "LEADER", action = action.RotatePanes("Clockwise") },
	{ key = "}", mods = "LEADER", action = action.RotatePanes("CounterClockwise") },
	{ key = "q", mods = "LEADER", action = action.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = action.TogglePaneZoomState },

	-- splits
	{ key = "v", mods = "LEADER", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "x", mods = "LEADER", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- select
	{ key = "j", mods = "LEADER", action = action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = action.ActivatePaneDirection("Up") },
	{ key = "h", mods = "LEADER", action = action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = action.ActivatePaneDirection("Right") },
	{ key = " ", mods = "LEADER", action = action.PaneSelect },

	{ key = "j", mods = super_key, action = action.ActivatePaneDirection("Down") },
	{ key = "k", mods = super_key, action = action.ActivatePaneDirection("Up") },
	{ key = "h", mods = super_key, action = action.ActivatePaneDirection("Left") },
	{ key = "l", mods = super_key, action = action.ActivatePaneDirection("Right") },

	--------------------------------------------------------------------------------
	-- Tabs
	{ key = "n", mods = "LEADER", action = action.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = action.ActivateTabRelative(-1) },

	{ key = "n", mods = super_key, action = action.ActivateTabRelative(1) },
	{ key = "p", mods = super_key, action = action.ActivateTabRelative(-1) },

	{ key = ">", mods = "LEADER", action = action.MoveTabRelative(1) },
	{ key = "<", mods = "LEADER", action = action.MoveTabRelative(-1) },

	{ key = "t", mods = "LEADER", action = action.SpawnTab("CurrentPaneDomain") },
	{ key = "t", mods = super_key, action = action.SpawnTab("CurrentPaneDomain") },
	{ key = "a", mods = "LEADER|CTRL", action = action.ActivateLastTab },

	{ key = "&", mods = "LEADER", action = action.CloseCurrentTab({ confirm = true }) },
	{ key = "T", mods = "LEADER", action = action.ShowTabNavigator },

	--------------------------------------------------------------------------------
	-- Actions
	{ key = "/", mods = "LEADER", action = action.Search({ CaseInSensitiveString = "" }) },
	{ key = "f", mods = super_key, action = action.Search({ CaseInSensitiveString = "" }) },
	{ key = "[", mods = "LEADER", action = action.ActivateCopyMode },
	{ key = "]", mods = "LEADER", action = action.QuickSelect },
	{ key = "P", mods = super_key, action = action.ActivateCommandPalette },
	{ key = "=", mods = "LEADER", action = action.ResetFontSize },

	{
		key = "y",
		mods = "LEADER",
		action = action.SpawnCommandInNewTab({ domain = "CurrentPaneDomain", args = { "lazygit" } }),
	},

	{
		key = "L",
		mods = "LEADER|SHIFT",
		action = action.Multiple({
			action.ClearScrollback("ScrollbackAndViewport"),
			action.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},

	--------------------------------------------------------------------------------
	-- Workspaces
	{ key = "w", mods = "LEADER", action = action.ShowLauncherArgs({ flags = "FUZZY|TABS|WORKSPACES" }) },
	{ key = "N", mods = "LEADER", action = action.SwitchWorkspaceRelative(1) },
	{ key = "P", mods = "LEADER", action = action.SwitchWorkspaceRelative(-1) },

	{
		key = "s",
		mods = "LEADER",
		action = action.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						action.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
}

--------------------------------------------------------------------------------
-- Copy/Search modes
local close_copy_mode = action.Multiple({
	{ CopyMode = "MoveToScrollbackBottom" },
	{ CopyMode = "Close" },
})

config.key_tables = {
	copy_mode = {
		{ key = "Escape", mods = "NONE", action = action.CopyMode("Close") },
		{ key = "c", mods = "CTRL", action = close_copy_mode },
		{ key = "q", mods = "NONE", action = close_copy_mode },

		{
			key = "y",
			mods = "NONE",
			action = action.Multiple({
				{ CopyTo = "ClipboardAndPrimarySelection" },
				{ CopyMode = "MoveToScrollbackBottom" },
				{ CopyMode = "Close" },
			}),
		},

		-- Movements
		{ key = "h", mods = "NONE", action = action.CopyMode("MoveLeft") },
		{ key = "j", mods = "NONE", action = action.CopyMode("MoveDown") },
		{ key = "k", mods = "NONE", action = action.CopyMode("MoveUp") },
		{ key = "l", mods = "NONE", action = action.CopyMode("MoveRight") },

		{ key = "w", mods = "NONE", action = action.CopyMode("MoveForwardWord") },
		{ key = "b", mods = "NONE", action = action.CopyMode("MoveBackwardWord") },
		{ key = "e", mods = "NONE", action = action.CopyMode("MoveForwardWordEnd") },

		{ key = "0", mods = "NONE", action = action.CopyMode("MoveToStartOfLine") },
		{ key = "^", mods = "NONE", action = action.CopyMode("MoveToStartOfLineContent") },
		{ key = "b", mods = "SHIFT", action = action.CopyMode("MoveToStartOfLineContent") },
		{ key = "$", mods = "NONE", action = action.CopyMode("MoveToEndOfLineContent") },

		{ key = "Enter", mods = "NONE", action = action.CopyMode("MoveToStartOfNextLine") },

		-- Enter search mode to edit the pattern.
		-- When the search pattern is an empty string the existing pattern is preserved
		{ key = "/", mods = "NONE", action = action({ Search = { CaseInSensitiveString = "" } }) },

		-- navigate any search mode results
		{ key = "n", mods = "NONE", action = action.CopyMode("NextMatch") },
		{ key = "N", mods = "SHIFT", action = action.CopyMode("PriorMatch") },
		{ key = "O", mods = "NONE", action = action.CopyMode("MoveToSelectionOtherEndHoriz") },
		{ key = "o", mods = "NONE", action = action.CopyMode("MoveToSelectionOtherEnd") },
		{ key = "F", mods = "NONE", action = action.CopyMode({ JumpBackward = { prev_char = false } }) },
		{ key = "T", mods = "NONE", action = action.CopyMode({ JumpBackward = { prev_char = true } }) },

		-- Scrollback
		{ key = "b", mods = "CTRL", action = action.CopyMode("PageUp") },
		{ key = "f", mods = "CTRL", action = action.CopyMode("PageDown") },
		{ key = "d", mods = "CTRL", action = action.CopyMode({ MoveByPage = 0.5 }) },
		{ key = "u", mods = "CTRL", action = action.CopyMode({ MoveByPage = -0.5 }) },

		{ key = "G", mods = "NONE", action = action.CopyMode("MoveToScrollbackBottom") },
		{ key = "g", mods = "NONE", action = action.CopyMode("MoveToScrollbackTop") },

		{ key = "H", mods = "NONE", action = action.CopyMode("MoveToViewportTop") },
		{ key = "L", mods = "NONE", action = action.CopyMode("MoveToViewportBottom") },
		{ key = "J", mods = "NONE", action = action.CopyMode("MoveToViewportMiddle") },
		{ key = "K", mods = "NONE", action = action.CopyMode("MoveToViewportMiddle") },

		-- Select
		{ key = "v", mods = "NONE", action = action.CopyMode({ SetSelectionMode = "Cell" }) },
		{ key = "v", mods = "SHIFT", action = action.CopyMode({ SetSelectionMode = "Line" }) },
		{ key = "v", mods = "CTRL", action = action.CopyMode({ SetSelectionMode = "Block" }) },
		{ key = "Space", mods = "NONE", action = action.CopyMode({ SetSelectionMode = "Cell" }) },
	},
	search_mode = {
		-- Scrollback
		{ key = "u", mods = "CTRL", action = action.ScrollByPage(-1) },
		{ key = "b", mods = "CTRL", action = action.ScrollByPage(1) },

		-- Actions
		{ key = "w", mods = "CTRL", action = action.CopyMode("ClearPattern") },
		{ key = "n", mods = "CTRL", action = action.CopyMode("NextMatch") },
		{ key = "p", mods = "CTRL", action = action.CopyMode("PriorMatch") },
		{ key = "r", mods = "CTRL", action = action.CopyMode("CycleMatchType") },

		-- Go back to copy mode when pressing enter, so that we can use unmodified keys like "n"
		-- to navigate search results without conflicting with typing into the search area.
		{ key = "Enter", mods = "NONE", action = "ActivateCopyMode" },
	},
	resize_pane = {
		{ key = "h", action = action.AdjustPaneSize({ "Left", 5 }) },
		{ key = "l", action = action.AdjustPaneSize({ "Right", 5 }) },
		{ key = "k", action = action.AdjustPaneSize({ "Up", 5 }) },
		{ key = "j", action = action.AdjustPaneSize({ "Down", 5 }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

--------------------------------------------------------------------------------
-- Mouse
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = super_key,
		action = action.OpenLinkAtMouseCursor,
	},
}

for i = 1, 8 do
	-- LEADER + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = action.ActivateTab(i - 1),
	})
end

return config
