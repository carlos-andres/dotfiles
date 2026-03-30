# dotfiles

Personal configuration repository for my command-line environment and terminal workflow.

## Overview

This repository contains my evolving set of **dotfiles**—configuration files that define how my shell and terminal behave. It reflects my day-to-day work, preferences, and ongoing improvements as I refine my development environment.

The goal is not perfection, but iteration: documenting what works, what changes, and why.

## Environment

* Shell: `bash`
* Terminals:

  * `WezTerm`
  * `iTerm2`
* OS: `macOS`

## Philosophy

* Keep things simple and readable
* Prefer small, incremental improvements
* Optimize for usability over complexity
* Document decisions when they matter

This repo is both:

* A **log of discoveries** and workflow improvements

## Current Contents

* `.inputrc` — Readline configuration for improved tab completion and command-line behavior

## Usage

This repository is managed with [`chezmoi`](https://www.chezmoi.io/), allowing reproducible setup across machines.

Basic flow:

```bash
chezmoi init https://github.com/carlos-andres/dotfiles.git
chezmoi apply
```

## Roadmap

Planned improvements:

* Add documentation per file (what + why)
* Create a table of contents for all configs
* Include terminal-specific configurations

## Notes

This is a personal project, but it is shared in case it helps others or sparks ideas.

Expect continuous changes.
