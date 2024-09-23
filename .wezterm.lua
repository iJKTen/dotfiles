local wezterm = require('wezterm')
local mux = wezterm.mux
local config = wezterm.config_builder()

config.tab_bar_at_bottom = true
config.font = wezterm.font 'Source Code Pro'
config.font_size = 16.0
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 5,
  right = 0,
  top = 0,
  bottom = 0,
}

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

config.window_decorations = 'RESIZE'
config.line_height = 1.025
config.color_scheme = 'Tomorrow (dark) (terminal.sexy)'

return config
