local wezterm = require("wezterm")
local config = {}
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config = {
  use_ime = true,
  default_cursor_style = "BlinkingBlock",
  automatically_reload_config = true,
  window_close_confirmation = "NeverPrompt",
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "INTEGRATED_BUTTONS|RESIZE",
  check_for_updates = true,
  use_fancy_tab_bar = true,
  tab_bar_at_bottom = false,
  font_size = 14,
  initial_rows = 20,
  initial_cols = 100,
  font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
  enable_tab_bar = true,
  window_padding = {
    left = 15,
    right = 20,
    top = 0,
    bottom = 20,
  },
  background = {    
    {
      source = {
        Color = "#2e2f41",
      },
      width = "100%",
      height = "100%",
      opacity = 0.85,
    },
  },
  -- from: https://akos.ma/blog/adopting-wezterm/
  hyperlink_rules = {
    -- Matches: a URL in parens: (URL)
    {
      regex = "\\((\\w+://\\S+)\\)",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in brackets: [URL]
    {
      regex = "\\[(\\w+://\\S+)\\]",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in curly braces: {URL}
    {
      regex = "\\{(\\w+://\\S+)\\}",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in angle brackets: <URL>
    {
      regex = "<(\\w+://\\S+)>",
      format = "$1",
      highlight = 1,
    },
    -- Then handle URLs not wrapped in brackets
    {
      -- Before
      --regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
      --format = '$0',
      -- After
      regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
      format = "$1",
      highlight = 1,
    },
    -- implicit mailto link
    {
      regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
      format = "mailto:$0",
    },
  },
  keys = {
    {
      key = 'LeftArrow',
      mods = 'CMD',
      action = wezterm.action { SendString = "\x1bOH" },
    },
    {
      key = 'RightArrow',
      mods = 'CMD',
      action = wezterm.action { SendString = "\x1bOF" },
    },
    {
      key = 'Home',
      mods = 'NONE',
      action = wezterm.action { SendString = "\x1bOH" },
    },
    {
      key = 'End',
      mods = 'NONE',
      action = wezterm.action { SendString = "\x1bOF" },
    },
  
  }
}


-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#CCC'
    local background = '#CCC'
    local foreground = '#888'

    if tab.is_active then
      background = '#2b2042'
      foreground = '#FFF'
    end

    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

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