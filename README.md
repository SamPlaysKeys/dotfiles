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
- **copy-dotfiles.sh**: Automated dotfile deployment script

## Installation

### Using the Copy Script (Recommended)

This repository uses a copy-based approach rather than symbolic linking for dotfile management:

```bash
# Clone the repository
git clone https://github.com/your-username/SetupFiles.git
cd SetupFiles

# Make the copy script executable
chmod +x copy-dotfiles.sh

# Run the copy script
./copy-dotfiles.sh
```

The script will:
- Automatically detect the structure of each dotfile directory
- Back up existing configurations (with `.bak` extension)
- Copy new configurations to their appropriate locations
- Provide colored output to track the installation progress

### Installing Applications

```bash
# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install all applications and tools from Brewfile
brew bundle install
```

## Why Copy Instead of Symlink?

This setup uses file copying rather than the traditional symbolic linking approach (like GNU Stow) for several advantages:

### **Independence from Source Location**
- Configurations work regardless of where the repository is located
- No broken links if the repository is moved or deleted
- Easier to maintain across multiple machines

### **Local Customization**
- Make machine-specific modifications without affecting the source repository
- Experiment with settings without impacting the master configuration
- Easier rollback to known-good configurations

### **Application Compatibility**
- Some applications don't properly follow symbolic links
- Better compatibility with security-conscious applications
- No issues with file permissions or ownership

### **Simplified Management**
- No dependency on external tools like GNU Stow
- Clear separation between template and active configurations
- Easier troubleshooting when things go wrong

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

## Usage Notes

- **First-time setup**: Run the copy script after cloning
- **Updates**: Re-run the copy script to apply new configurations
- **Customization**: Modify copied files directly in your home directory
- **Backup**: The script automatically creates backups of existing configurations

## Contributing

Feel free to explore, adapt, or draw inspiration from these configurations for your own development environment. Suggestions and improvements are always welcome!

---

*This setup is optimized for macOS development workflows. While some configurations may work on other platforms, they are primarily tested and maintained for macOS environments.*
