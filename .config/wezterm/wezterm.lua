-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- color scheme and fonts
config.font = wezterm.font 'Iosevka Nerd Font Mono'
config.font_size = 16.0
config.color_scheme = 'Catppuccin Mocha'

-- window sizing and appearance
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 10
config.hide_tab_bar_if_only_one_tab = true
wezterm.on("gui-startup", function()
  local tab, pane, window = wezterm.mux.spawn_window{}
  window:gui_window():maximize()
end)

-- and finally, return the configuration to wezterm
return config
