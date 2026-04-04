# .wezterm.lua

Back to the [documentation index](INDEX.md)

## Source File

Repository file: [dot_wezterm.lua](https://github.com/carlos-andres/dotfiles/blob/main/dot_wezterm.lua)

## What this file is

This file configures **WezTerm**, a GPU-accelerated terminal emulator written in Rust. It defines appearance, window behavior, performance tuning, key bindings, and a custom status bar plugin.

## Why I added it

To have a portable, well-documented WezTerm configuration optimized for macOS development with pane-based workflows and a custom status bar.

## Sections

### Appearance

Sets the color scheme to Molokai and applies window padding to prevent text from being cut off at screen edges. Inactive panes are dimmed to make the active pane visually distinct. The font stack uses Hack Nerd Font Mono as the primary face with JetBrains Mono as a fallback, and subpixel font rendering is enabled for sharper text on macOS displays.

### Window

Configures the initial window size to 37 rows by 140 columns and strips decorations down to RESIZE only for a minimal chrome. Native macOS fullscreen is enabled, the SSH backend is set to Ssh2 (using the system OpenSSH implementation), and the Kitty keyboard protocol is disabled to avoid compatibility issues with tools like Claude Code and nano.

### Performance

Selects the WebGpu rendering frontend and caps the frame rate at 60fps to avoid unnecessary GPU work. The scrollbar is disabled to reduce rendering overhead, and the scrollback buffer is set to 10,000 lines.

### Key bindings

Defines pane splitting with Cmd+D (horizontal) and Cmd+Shift+D (vertical), and pane navigation with Cmd+Arrow keys. Standard clipboard operations use Cmd+C and Cmd+V. Cmd+F opens the search overlay, Cmd+Shift+K clears the scrollback buffer, and Cmd+Shift+R reloads the configuration.

### Tab bar

The tab bar is enabled to support plugin rendering. It serves as the mount point for the devbar status bar plugin.

### Plugin: devbar

Uses [devbar.wezterm](https://github.com/carlos-andres/devbar.wezterm), a custom status bar plugin that displays workspace name, mode indicator, git branch, runtime versions, datetime, and SSH connection status. Segments are configurable and support truncation for narrow windows. The plugin caches expensive lookups to keep the tab bar responsive.

### Search mode tweaks

Adds macOS-native Find Next and Find Previous shortcuts (Cmd+G and Cmd+Shift+G) to the search overlay. This makes the search experience consistent with standard macOS text navigation conventions.
