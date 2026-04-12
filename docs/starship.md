# .config/starship.toml

Back to the [documentation index](INDEX.md)

## Source File

Repository file: [dot_config/starship.toml](https://github.com/carlos-andres/dotfiles/blob/main/dot_config/starship.toml)

## What this file is

This file configures **Starship**, a cross-shell prompt written in Rust. It controls how the command prompt looks and what context it shows, including the current directory, Git state, language runtimes, cloud tooling, and shell status information.

## Why I added it

I added this file to keep my prompt configuration versioned and documented, since the prompt is part of the daily command-line workflow and carries a lot of useful context.

## Main Areas

### Prompt structure

The prompt uses a custom two-line format. The first line is the context line, where directory, Git, runtime, infrastructure, and shell-state modules appear. The second line is the input line with the main prompt character.

### Color palette

The configuration defines a custom Dracula-inspired palette and uses it consistently across modules. This keeps the prompt visually coherent while still making status changes easy to notice.

### Context modules

The prompt enables modules for operating system, current directory, Git branch and status, command duration, and shell status. These are the core modules that make the prompt immediately useful in most directories.

### Language and infrastructure modules

It also enables modules for common runtimes and tools such as Python, Node.js, PHP, Java, Rust, Go, Swift, Lua, Docker, Kubernetes, AWS, and Google Cloud. These modules appear only when Starship detects relevant context.

### Portability notes

This file does not contain secrets or machine-specific paths. It is a good candidate for tracking directly in the repository.

The prompt uses Nerd Font-style glyphs, so the appearance is best when the terminal font supports those symbols.
