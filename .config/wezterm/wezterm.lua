-- Pull in the wezterm API & hold wezterm config
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local conf
local WA = wezterm.action

--
----------------------- CONFIGS --------------------------

conf = {
	------------- window Apperance -----------------
	window_decorations = "TITLE | RESIZE",
	color_scheme = "Catppuccin Macchiato (Gogh)",
	enable_scroll_bar = false, -- doesn't have option to show if needed.
	scrollback_lines = 10000,
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},
	window_background_opacity = 1.0,

	---------------- font settings ---------------
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 11.1,

	-------------  Tab bar --------------------
	enable_tab_bar = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	tab_bar_at_bottom = true,

	-------------- KeyBinds --------------------
	keys = {
		{
			-- Copy Mode
			action = WA.ActivateCopyMode, -- WA: See top
			mods = "CTRL|SHIFT",
			key = "Space",
		},
		{
			-- Search Mode
			action = WA.Search({ CaseInSensitiveString = "" }),
			mods = "CTRL|SHIFT",
			key = "?",
		},

		------------ Split mode Activity ---------------
		{
			-- split Left-Right
			action = WA.SplitHorizontal({ domain = "CurrentPaneDomain" }),
			mods = "CTRL|SHIFT",
			key = "|",
		},
		{
			-- split Top-Bottom
			action = WA.SplitVertical({ domain = "CurrentPaneDomain" }),
			mods = "CTRL|SHIFT",
			key = "_",
		},
		{
			-- Focus left split
			action = WA.ActivatePaneDirection("Left"),
			mods = "CTRL|SHIFT",
			key = "h",
		},
		{
			-- Focus Right split
			action = WA.ActivatePaneDirection("Right"),
			mods = "CTRL|SHIFT",
			key = "l",
		},
		{
			-- Focus left split
			action = WA.ActivatePaneDirection("Down"),
			mods = "CTRL|SHIFT",
			key = "j",
		},
		{
			-- Focus Right split
			action = WA.ActivatePaneDirection("Up"),
			mods = "CTRL|SHIFT",
			key = "k",
		},
		-----------------------------------------------------

		{
			-- Full Screen mode
			action = WA.ToggleFullScreen,
			mods = "",
			key = "F11",
		},
		{
			-- Launcher Menu
			action = WA.ShowLauncher,
			mods = "CTRL|SHIFT",
			key = "Enter",
		},
	},
}

--
--
--
--
-- --------------------------------------------------------------
-- return whole config
for key, value in pairs(conf) do
	config[key] = value
end

return config
