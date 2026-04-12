# Dotfiles Documentation

Reference for each managed dotfile: what it configures, why it exists, and how it works.

## Files

| File | Description | Doc |
|------|-------------|-----|
| `.bash_profile` | Bash shell profile for PATH, history, prompt, and CLI tool helpers | [bash_profile.md](bash_profile.md) |
| `.inputrc` | GNU Readline configuration for bash and other CLI tools | [inputrc.md](inputrc.md) |
| `.gitignore_global` | Global Git ignore rules applied across all repositories | [gitignore_global.md](gitignore_global.md) |
| `.nanorc` | Nano text editor configuration with syntax highlighting | [nanorc.md](nanorc.md) |
| `.wezterm.lua` | WezTerm terminal emulator configuration | [wezterm.md](wezterm.md) |

## Setup Scripts

Scripts in `.chezmoiscripts/` run automatically during `chezmoi apply`.

| Script | Runs | Purpose | Doc |
|--------|------|---------|-----|
| `run_once_after_configure-git-global.sh` | Once | Sets `core.excludesFile` in global Git config | [gitignore_global.md](gitignore_global.md#required-setup) |
