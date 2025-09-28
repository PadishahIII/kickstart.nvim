#!/bin/bash
# Prerequisite:
# - Homebrew installed
# Run this script using a non-root user!

brew update
brew install node
brew install neovim
brew install ripgrep
brew install fd
brew install --cask font-hack-nerd-font
brew install lazygit
brew install --cask gg
brew install gnu-sed

# Python LSP
# pip install pyright
# pip install python-lsp-server[all]
# pip install python-lsp-ruff # Fast linting

# Markdown lint
npm install -g markdownlint-cli

# Optional
# Install Gemini CLI to use the `gemini_cli` adapter in CodeCompanion.
# npm install -g @google/gemini-cli
