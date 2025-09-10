# Zellij Configuration Context

This directory contains configuration files for Zellij, a terminal multiplexer.

## Key Files

- `config.kdl`: The current active configuration file for Zellij. This file defines keybindings, plugins, themes, and other settings.
- `config.kdl.bak`: A backup of a previous configuration. This can be useful for restoring settings or comparing changes.
- `tmux-config.kdl`: A new configuration file that implements tmux-like keybindings using Ctrl+b as the prefix.

## Configuration Overview

The main configuration file (`config.kdl`) is written in the KDL (KDL Document Language) format. It allows customization of various aspects of Zellij:

1.  **Keybindings**: Extensive customization of keyboard shortcuts for different modes (normal, pane, tab, resize, move, scroll, search, session, tmux, etc.). The current config uses `clear-defaults=true`, meaning all default keybindings are removed and only the ones defined in this file are active.
2.  **Plugins**: Definition of available plugins (e.g., `compact-bar`, `status-bar`, `tab-bar`, `session-manager`, `strider`) and their locations.
3.  **Themes**: Custom color themes can be defined. The active theme is set with the `theme` directive.
4.  **Options**: Various options can be configured, such as:
    *   `default_mode`: The initial input mode.
    *   `theme`: The active color theme.
    *   `default_shell`: The shell used in new panes.
    *   `mouse_mode`: Enable/disable mouse support.
    *   `pane_frames`: Show/hide pane borders.
    *   `scroll_buffer_size`: Number of lines to keep in scrollback.
    *   `copy_command`: Command to use for copying text.
    *   And many others related to session management, layout, and UI behavior.

This configuration is tailored for a user who prefers explicit control over keybindings and has customized their theme (currently using a theme named "naimo84").

For future interactions, it's important to understand that changes to keybindings, themes, or plugin configurations should be made in `config.kdl`. The `.bak` file serves as a reference point for previous configurations.

The `tmux-config.kdl` file provides an alternative configuration that uses tmux-like keybindings with `Ctrl+b` as the prefix. This file can be used by launching Zellij with:
`zellij --config /Users/benjamin/.config/zellij/tmux-config.kdl`