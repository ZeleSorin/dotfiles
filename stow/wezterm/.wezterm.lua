local wezterm = require 'wezterm'

local config = wezterm.config_builder()

--General
config.font_size = 16
config.line_height = 1.5
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.color_scheme = "tokyonight_night"
local terminal_opacity = 0.87
local photo_opacity = 0.40
local black_opacity = (terminal_opacity - photo_opacity) / (1 - photo_opacity)
config.background = {
  {
    source = { Color = '#000000' },
    width = '100%',
    height = '100%',
    opacity = black_opacity,
  },
  {
    source = {
      File = wezterm.home_dir .. '/.config/wezterm/background.png',
    },
    width = 'Cover',
    height = 'Cover',
    horizontal_align = 'Center',
    vertical_align = 'Middle',
    repeat_x = 'NoRepeat',
    repeat_y = 'NoRepeat',
    opacity = photo_opacity,
    hsb = {
      brightness = 0.14,
      saturation = 0.55,
      hue = 1.0,
    },
  },
}
config.colors = {
  background = '#000000',
  foreground = '#d4d4d4',
  cursor_bg = '#7aa2f7',
  cursor_border = '#7aa2f7',
  ansi = {
    '#15161e',
    '#f7768e',
    '#9ece6a',
    '#e0af68',
    '#9b9b9b',
    '#bb9af7',
    '#7dcfff',
    '#a9b1d6',
  },
  brights = {
    '#414868',
    '#f7768e',
    '#9ece6a',
    '#e0af68',
    '#c5c5c5',
    '#bb9af7',
    '#7dcfff',
    '#c0caf5',
  },
  tab_bar = {
    background = '#202124',
    active_tab = {
      bg_color = '#44474f',
      fg_color = '#e0e6fa',
      intensity = 'Normal',
      underline = 'Single',
      italic = false,
    },
    inactive_tab = {
      bg_color = '#202124',
      fg_color = '#7a84ad',
    },
    inactive_tab_hover = {
      bg_color = '#29334d',
      fg_color = '#7aa2f7',
      italic = false,
    },
  },
}
config.window_frame = {
  border_left_width = '1px',
  border_right_width = '1px',
  border_top_height = '1px',
  border_bottom_height = '1px',
  border_left_color = '#b8b8b8',
  border_right_color = '#b8b8b8',
  border_top_color = '#b8b8b8',
  border_bottom_color = '#b8b8b8',
  active_titlebar_border_bottom = '#b8b8b8',
  inactive_titlebar_border_bottom = '#b8b8b8',
}
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW'
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.integrated_title_button_style = 'MacOsNative'
config.integrated_title_button_alignment = 'Left'
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 28




local function tab_title(tab)
  if tab.tab_title and #tab.tab_title > 0 then
    return tab.tab_title
  end

  return tab.active_pane.title
end

wezterm.on('format-tab-title', function(tab, _, _, _, _, max_width)
  local number = string.format('%d: ', tab.tab_index + 1)
  local title_width = math.max(1, max_width - wezterm.column_width(number) - 2)
  local title = wezterm.truncate_right(tab_title(tab), title_width)
  local number_color = tab.is_active and '#ffffff' or '#eef1f7'
  local title_color = tab.is_active and '#e0e6fa' or '#aeb4c2'

  return {
    { Text = ' ' },
    { Foreground = { Color = number_color } },
    { Attribute = { Intensity = 'Bold' } },
    { Text = number },
    { Attribute = { Intensity = 'Normal' } },
    { Foreground = { Color = title_color } },
    { Text = title .. ' ' },
  }
end)

-- key bindings

config.keys = {
{
	key = 'w',
	mods = 'CMD',
	action = wezterm.action.CloseCurrentPane {confirm = true},
},
{
	key = 'd',
	mods = 'CMD',
	action = wezterm.action.SplitHorizontal {domain = 'CurrentPaneDomain' },
},
{
	key = 'd',
	mods = 'CMD|SHIFT',
	action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain'},

},
{
	key = 'k',
	mods = 'CMD',
	action = wezterm.action.SendString 'clear\n',
},

}
return config
