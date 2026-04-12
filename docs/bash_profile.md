# .bash_profile

Back to the [documentation index](INDEX.md)

## Source File

Repository file: [dot_bash_profile](https://github.com/carlos-andres/dotfiles/blob/main/dot_bash_profile)

## What this file is

This file configures the interactive `bash` shell environment used on macOS. It covers PATH setup, history behavior, shell options, prompt integrations, aliases, and helper functions for common command-line tools.

## Why I added it

I added this file to keep a documented backup of the shell environment I actually use, while still keeping the tracked version portable enough to share and review.

## Workflow Note

This file currently follows a one-way `chezmoi` workflow:

1. Update the live local `~/.bash_profile` first.
2. Import it into the source repo with `chezmoi add ~/.bash_profile`.
3. Clean the source copy before commit so it does not depend on personal paths, secrets, or machine-only assumptions.
4. Commit and push the sanitized source file.
5. Avoid applying the tracked version back onto a machine without reviewing local customizations first.

For machine-specific settings, prefer a local-only file such as `~/.bash_profile.local` and source it from the main profile when needed.

## Main Areas

### PATH and environment

The profile sets a predictable PATH order with user binaries first, then Homebrew, then the inherited system PATH. It also enables a few shell-level environment defaults such as locale, terminal type, and Homebrew behavior flags.

### History behavior

The history setup appends instead of overwriting, timestamps commands, filters common noise, and includes helper functions for cleaning and inspecting shell history.

### Optional tool integrations

The file includes guarded integrations for tools such as NVM, bash-completion, WezTerm shell integration, zoxide, direnv, Starship, Cargo, LM Studio, and iTerm2. These sections are written to fail quietly when the tool is not installed.

### Aliases and helpers

It includes a mix of navigation aliases, Git shortcuts, terminal helpers, and personal workflow functions. Tool-specific helpers are guarded where practical so the tracked version remains usable on systems with fewer tools installed.
