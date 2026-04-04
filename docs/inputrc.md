# .inputrc

Back to the [documentation index](INDEX.md)

## Source File

Repository file: [dot_inputrc](https://github.com/carlos-andres/dotfiles/blob/main/dot_inputrc)

## What this file is

This file configures **GNU Readline**, the library that powers command-line editing and completion in tools like `bash`.

It helps shape how completion behaves when pressing `Tab`, how suggestions are shown, and how noisy or quiet the command-line experience feels.

## Why I added it

I added this file to make shell completion feel more natural and less disruptive during daily work.


## Settings

### `set completion-ignore-case on`

This means completion works even when the typed text does not match the exact uppercase or lowercase form of the target.

### `set show-all-if-ambiguous on`

Instead of requiring extra steps, it reveals available options earlier.

### `set completion-query-items 200`

This reduces interruptions when many completion candidates exist.

### `set mark-symlinked-directories on`

This makes directory targets easier to recognize while navigating.

### `set skip-completed-text on`

This can make repeated completion behavior feel cleaner.

### `set page-completions off`

This keeps the flow simpler and avoids pausing through completion screens.

### `set bell-style none`

This removes audible or visual noise during completion and editing.
