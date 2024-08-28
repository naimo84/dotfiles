local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config = {
  use_ime = true,
  default_cursor_style = "BlinkingBlock",
  automatically_reload_config = true,
  window_close_confirmation = "NeverPrompt",
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "RESIZE",
  check_for_updates = true,
  use_fancy_tab_bar = true,
  tab_bar_at_bottom = false,
  font_size = 14,
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
        Color = "#282c35",
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
return config