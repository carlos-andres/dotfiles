# dotfiles

Personal configuration repository for my command-line environment and terminal workflow.

## Overview

This repository contains my evolving set of **dotfiles**—configuration files that define how my shell and terminal behave. It reflects my day-to-day work, preferences, and ongoing improvements as I refine my development environment.

The goal is not perfection, but iteration: documenting what works, what changes, and why.

## Environment

* Shell: `bash`
* Terminals: `WezTerm`, `iTerm2`
* OS: `macOS`
* Editor: `nano` (Homebrew)

## Philosophy

* Keep things simple and readable
* Prefer small, incremental improvements
* Optimize for usability over complexity
* Document decisions when they matter

This repo is a **log of discoveries** and workflow improvements — both a working setup and a reference for why things are the way they are.

## Contents

| File | Purpose |
|------|---------|
| `.inputrc` | Readline configuration for tab completion and command-line behavior |
| `.gitignore_global` | Global Git ignore rules for macOS, IDE, and AI tool artifacts |
| `.nanorc` | Nano editor setup with syntax highlighting and modern defaults |
| `.wezterm.lua` | WezTerm terminal configuration with keybindings and status bar |

Each file has detailed documentation in the [`docs/`](docs/INDEX.md) folder explaining what it does and why.

## Setup Scripts

Scripts in `.chezmoiscripts/` run automatically during `chezmoi apply`:

| Script | Purpose |
|--------|---------|
| `run_once_after_configure-git-global.sh` | Sets `core.excludesFile` in global Git config |

## Usage

This repository is managed with [`chezmoi`](https://www.chezmoi.io/), allowing reproducible setup across machines.

```bash
chezmoi init https://github.com/carlos-andres/dotfiles.git
chezmoi apply
```

Setup scripts run automatically on first apply. See the [documentation index](docs/INDEX.md) for prerequisites that require manual steps (like installing nano via Homebrew).

## Roadmap

* Expand to more shell and tool configurations
* Add `run_once_` scripts for remaining setup dependencies
* Explore chezmoi templates for multi-machine support

## Notes

This is a personal project, but it is shared in case it helps others or sparks ideas.

Expect continuous changes.
