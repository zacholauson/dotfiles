local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.colors = {
  background = '#26292c'
}
config.window_decorations = "RESIZE"
config.color_scheme = 'Tomorrow Night'
config.default_cwd = wezterm.home_dir .. "/dev"
config.font = wezterm.font_with_fallback {
  'Inconsolata',
  'Jetbrains Mono',
}
config.font_size = 15

config.keys = {
  {
    key    = '-',
    mods   = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },
  {
    key    = '+',
    mods   = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key    = '[',
    mods   = 'LEADER',
    action = wezterm.action.ActivateCopyMode,
  },
  {
    key    = ']',
    mods   = 'LEADER',
    action = wezterm.action.QuickSelect,
  },
  {
    key    = '<',
    mods   = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key    = '>',
    mods   = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  {
    key    = ',',
    mods   = 'LEADER',
    action = wezterm.action.PromptInputLine {
      description = 'Enter new tab title',
      action      = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  {
    key    = 'a',
    mods   = 'LEADER',
    action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
  },
  {
    key    = 'a',
    mods   = 'LEADER|CTRL',
    action = wezterm.action.ActivateLastTab,
  },
  {
    key    = 'c',
    mods   = 'LEADER',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key    = 'd',
    mods   = 'LEADER',
    action = wezterm.action.ScrollByPage(1),
  },
  {
    key    = 'g',
    mods   = 'LEADER',
    action = wezterm.action.ScrollToTop,
  },
  {
    key    = 'h',
    mods   = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key    = 'j',
    mods   = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key    = 'k',
    mods   = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key    = 'l',
    mods   = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key    = 'n',
    mods   = 'LEADER',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key    = 'p',
    mods   = 'LEADER',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key    = 'r',
    mods   = 'LEADER',
    action = wezterm.action.ReloadConfiguration,
  },
  {
    key    = 's',
    mods   = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key    = 'u',
    mods   = 'LEADER',
    action = wezterm.action.ScrollByPage(-1),
  },
  {
    key    = 'v',
    mods   = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key    = 'G',
    mods   = 'LEADER',
    action = wezterm.action.ScrollToBottom,
  },
  {
    key    = 'J',
    mods   = 'LEADER',
    action = wezterm.action.ScrollByLine(1),
  },
  {
    key    = 'K',
    mods   = 'LEADER',
    action = wezterm.action.ScrollByLine(-1),
  },
  {
    key    = 'N',
    mods   = 'LEADER',
    action = wezterm.action.MoveTabRelative(1),
  },
  {
    key    = 'P',
    mods   = 'LEADER',
    action = wezterm.action.MoveTabRelative(-1),
  }
}
for i = 1, 8 do
  table.insert(config.keys, {
    key    = tostring(i),
    mods   = 'LEADER',
    action = wezterm.action.ActivateTab(i - 1),
  })
end
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.tab_bar_at_bottom = true
config.window_frame = {
  font = wezterm.font { family = 'Mensch', weight = 'Regular' },
  font_size = 13,
  inactive_titlebar_bg = '#26292c',
}

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick

function tab_title(tab_info)
  local title = tab_info.tab_title
	local tab_pos_prefix = (tab_info.tab_index + 1) .. ': '
  if title and #title > 0 then
    return tab_pos_prefix .. title
  end
  return tab_pos_prefix .. tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#0b0022'
    local background = '#1b1032'
    local foreground = '#808080'

    if tab.is_active then
      background = '#0087af'
      foreground = '#ffffff'
    elseif hover then
      background = '#0b0022'
      foreground = '#909090'
    end

    local edge_foreground = background
    local title = tab_title(tab)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)

return config
