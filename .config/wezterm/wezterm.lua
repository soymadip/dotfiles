-- Pull in the wezterm API & hold wezterm config
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Apperance
config.window_decorations = "RESIZE"
config.color_scheme = "Catppuccin Macchiato (Gogh)"

-- font settings
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 11.1

-- Tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

return config
