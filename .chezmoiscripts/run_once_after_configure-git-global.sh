#!/bin/bash
set -eu

# Configure global gitignore so Git ignores machine-specific artifacts
# (macOS metadata, IDE configs, AI tool caches) across all repositories.
git config --global core.excludesFile ~/.gitignore_global
