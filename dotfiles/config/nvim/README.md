# Neovim Configuration

This directory contains the Neovim configuration for the dotfiles.

## Organization

- **`init.lua`**: The main entry point for Neovim.
- **`lua/sam/`**: The core configuration directory.
  - **`core/`**: Contains core settings like `options.lua`, `keymaps.lua`, and `autocmds.lua`.
  - **`plugins/`**: Contains individual plugin configurations managed by Lazy.nvim.
- **`lazy-lock.json`**: Lockfile for Lazy.nvim plugin versions.

This setup is designed to provide a modern, IDE-like experience using LSP, Treesitter, and other modern Neovim plugins.
