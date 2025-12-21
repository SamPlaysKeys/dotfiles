✨ **SetupFiles** ✨

## Overview

This repository contains my personal development environment configuration files and setup scripts for macOS. The setup focuses on creating an efficient, modern development workflow centered around **Warp.dev**, **Neovim**, and other carefully selected command-line tools.

These dotfiles represent an ongoing journey of optimization and refinement, continuously updated to incorporate new discoveries and evolving development needs.

## What's Included

### Dotfiles
- **NeoVim**: Complete IDE-like configuration with LSP, autocompletion, and modern plugins
- **Shell**: Zsh configuration with aliases, functions, and environment settings
- **Warp**: Terminal configuration and themes
- **Yazi**: File manager configuration for efficient file navigation

### Setup Tools
- **Brewfile**: Comprehensive list of development tools and applications

## Additional Installation Steps

### Installing Applications
```bash
# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install all applications and tools from Brewfile
brew bundle install
```
### Installing Fonts
```bash
# Use my hack-fonts Github repo to quickly install the Hack typeface for NeoVim and Yazi support
cd /Library/Fonts && git clone https://github.com/SamPlaysKeys/hack-fonts.git
```

## Key Principles

### Cloud-Synced Tools Exclusion
Configurations for applications with built-in cloud synchronization (e.g., Microsoft Edge, Visual Studio Code, Raycast) are intentionally excluded. These tools maintain their own cross-device sync mechanisms.

### Iterative Development
This configuration evolves continuously. Each update incorporates lessons learned, new tool discoveries, and workflow optimizations. The setup represents a living system rather than a static solution.

## Future Development

A more robust automation tool is currently in development to enhance the dotfile management experience. This future tool will provide:
- Automated updates and synchronization
- Better conflict resolution
- Enhanced customization options
- Cross-platform compatibility improvements

The current copy-based approach serves as a solid foundation while this enhanced tooling is being developed.

## Contributing

Feel free to explore, adapt, or draw inspiration from these configurations for your own development environment. Suggestions and improvements are always welcome!

---

*This setup is optimized for macOS development workflows. While some configurations may work on other platforms, they are primarily tested and maintained for macOS environments.*
