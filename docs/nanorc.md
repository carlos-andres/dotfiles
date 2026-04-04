# .nanorc

Back to the [documentation index](INDEX.md)

## Source File

Repository file: [dot_nanorc](https://github.com/carlos-andres/dotfiles/blob/main/dot_nanorc)

## What this file is

Configuration for the **nano** text editor. Controls editing behavior, display options, and syntax highlighting.

## Why I added it

To make nano a capable everyday editor with modern features like line numbers, syntax highlighting, and mouse support — especially useful for quick edits and as a git commit editor.

## Required Setup

> **Important:** This configuration expects nano installed via Homebrew, which provides a more up-to-date version than the one shipped with macOS. The macOS system nano is outdated and may not support all settings in this file.
>
> ```bash
> brew install nano
> ```
>
> Syntax highlighting requires cloning the nano-syntax-highlighting repository:
>
> ```bash
> git clone https://github.com/galenguyer/nano-syntax-highlighting ~/.nano
> ```
>
> Make sure Homebrew's nano takes precedence in your PATH (e.g. `/opt/homebrew/bin/nano`).

## Settings

Settings are grouped by intent rather than listed line-by-line.

- **Display**: `linenumbers` (show line numbers), `constantshow` (always show cursor position), `indicator` (show scrollbar indicator), `minibar` (compact status bar replacing title bar)
- **Editing behavior**: `softwrap` (wrap long lines visually without altering the file), `mouse` (enable mouse support for clicking and scrolling), `multibuffer` (open multiple files in buffers), `quickblank` (status messages disappear after 1 keystroke)
- **Navigation**: `jumpyscrolling` (scroll by half-screens instead of line-by-line)
- **Syntax highlighting**: Loads all `.nanorc` files from `~/.nano/` and `~/.nano/syntax/` via the `include` directive. These come from [galenguyer/nano-syntax-highlighting](https://github.com/galenguyer/nano-syntax-highlighting).
