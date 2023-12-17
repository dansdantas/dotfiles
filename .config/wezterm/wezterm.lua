local wezterm = require("wezterm")
local config = {}

--------------------------------------------------------------------------------
-- Options
config.color_scheme = "Tokyo Night"
config.font = wezterm.font("Fantasque Sans Mono")
config.window_decorations = "RESIZE"

config.scrollback_lines = 1024000

config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.tab_bar_at_bottom = true

config.native_macos_fullscreen_mode = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_frame = {
	border_left_width = "0",
	border_right_width = "0",
	border_bottom_height = "0",
	border_top_height = "0",
}

config.skip_close_confirmation_for_processes_named = {
	"bash",
	"sh",
	"zsh",
	"tmux",
}

local action = wezterm.action
local callback = wezterm.action_callback

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 5000 }
config.keys = {
	--------------------------------------------------------------------------------
	-- Callbacks
	{
		key = "g",
		mods = "LEADER",
		action = callback(function(window, _, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.enable_tab_bar == nil then
				overrides.enable_tab_bar = false
			else
				overrides.enable_tab_bar = not overrides.enable_tab_bar
			end
			window:set_config_overrides(overrides)
		end),
	},

	{
		key = "m",
		mods = "LEADER",
		action = callback(function(window, _, _)
			window:maximize()
		end),
	},

	{
		key = "r",
		mods = "LEADER",
		action = callback(function(window, _, _)
			window:restore()
		end),
	},

	{ key = "=", mods = "LEADER", action = action.ResetFontSize },

	--------------------------------------------------------------------------------
	-- Movements

	{ key = "{", mods = "LEADER", action = action.RotatePanes("Clockwise") },
	{ key = "}", mods = "LEADER", action = action.RotatePanes("CounterClockwise") },
	{ key = "q", mods = "LEADER", action = action.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },

	-- splits
	{ key = "v", mods = "LEADER", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "x", mods = "LEADER", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- select pane
	{ key = "j", mods = "LEADER", action = action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = action.ActivatePaneDirection("Up") },
	{ key = "h", mods = "LEADER", action = action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = action.ActivatePaneDirection("Right") },
	{ key = " ", mods = "LEADER", action = action.PaneSelect },

	--------------------------------------------------------------------------------
	-- Tabs

	{ key = "n", mods = "LEADER", action = action.ActivateTabRelative(-1) },
	{ key = "p", mods = "LEADER", action = action.ActivateTabRelative(1) },

	{ key = ">", mods = "LEADER", action = action.MoveTabRelative(1) },
	{ key = "<", mods = "LEADER", action = action.MoveTabRelative(-1) },

	{ key = "t", mods = "LEADER", action = action.SpawnTab("CurrentPaneDomain") },
	{ key = "a", mods = "LEADER|CTRL", action = action.ActivateLastTab },

	{ key = "&", mods = "LEADER", action = action.CloseCurrentTab({ confirm = true }) },
	{ key = "T", mods = "LEADER", action = action.ShowTabNavigator },

	--------------------------------------------------------------------------------
	-- Actions
	{ key = "[", mods = "LEADER", action = action.QuickSelect },
	{ key = "P", mods = "CMD", action = wezterm.action.ActivateCommandPalette },
	{ key = "f", mods = "CMD", action = action({ Search = { CaseInSensitiveString = "" } }) },

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

for i = 1, 8 do
	-- CTRL+ALT + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = action.ActivateTab(i - 1),
	})
end

--------------------------------------------------------------------------------
-- Copy/Search modes
config.key_tables = {
	copy_mode = {
		{ key = "Escape", mods = "NONE", action = action({ CopyMode = "Close" }) },
		{ key = "h", mods = "NONE", action = action({ CopyMode = "MoveLeft" }) },
		{ key = "j", mods = "NONE", action = action({ CopyMode = "MoveDown" }) },
		{ key = "k", mods = "NONE", action = action({ CopyMode = "MoveUp" }) },
		{ key = "l", mods = "NONE", action = action({ CopyMode = "MoveRight" }) },
		-- { key = " ", mods = "NONE", action = wezterm.action({ CopyMode = "ToggleSelectionByCell" }) },
		-- Enter search mode to edit the pattern.
		-- When the search pattern is an empty string the existing pattern is preserved
		{ key = "/", mods = "NONE", action = action({ Search = { CaseInSensitiveString = "" } }) },
		-- navigate any search mode results
		{ key = "n", mods = "NONE", action = action({ CopyMode = "NextMatch" }) },
		{ key = "N", mods = "SHIFT", action = action({ CopyMode = "PriorMatch" }) },
		{ key = "y", mods = "NONE", action = action({ CopyMode = "AcceptPattern" }) },

		-- Scrollback
		{ key = "u", mods = "CTRL", action = action.ScrollByPage(-1) },
		{ key = "b", mods = "CTRL", action = action.ScrollByPage(1) },
		{ key = "G", mods = "NONE", action = action.ScrollToBottom },
		{ key = "g", mods = "NONE", action = action.ScrollToTop },
	},
	search_mode = {
		-- Scrollback
		{ key = "u", mods = "CTRL", action = action.ScrollByPage(-1) },
		{ key = "b", mods = "CTRL", action = action.ScrollByPage(1) },
		{ key = "Enter", mods = "CTRL", action = action.ScrollToBottom },

		{ key = "w", mods = "CTRL", action = action({ CopyMode = "ClearPattern" }) },
		{ key = "Escape", mods = "NONE", action = action({ CopyMode = "Close" }) },
		-- Go back to copy mode when pressing enter, so that we can use unmodified keys like "n"
		-- to navigate search results without conflicting with typing into the search area.
		{ key = "Enter", mods = "NONE", action = "ActivateCopyMode" },
	},
}

--------------------------------------------------------------------------------
-- Events
local mux = wezterm.mux
wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config