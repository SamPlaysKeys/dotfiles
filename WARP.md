# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

# SetupFiles - Personal Development Environment Configuration

This repository contains optimized dotfiles for a macOS development environment centered around **Warp Terminal** and **Neovim**. The configurations are deployed using **GNU Stow** for clean, symlinked management.

## Table of Contents

- [Common Commands](#common-commands)
- [Architecture Overview](#architecture-overview)
- [Neovim Configuration](#neovim-configuration)
- [Warp Terminal Configuration](#warp-terminal-configuration)
- [Yazi File Manager Configuration](#yazi-file-manager-configuration)
- [Development Workflows](#development-workflows)
- [References](#references)

## Common Commands

### Homebrew Package Management
```bash
# Install all packages and applications from Brewfile
brew bundle

# Update Brewfile with currently installed packages
brew bundle dump --force

# Install specific category
brew bundle --file=Brewfile
```

### Dotfiles Deployment
```bash
# Deploy all dotfiles using the provided script
./stowdotfiles.sh

# Manual stow commands (if script needs modification)
stow -v --dir=$HOME/Dev/SetupFiles/nvim/ --target=$HOME/ --stow /
stow -v --dir=$HOME/Dev/SetupFiles/Warp/ --target=$HOME/ --stow /
stow -v --dir=$HOME/Dev/SetupFiles/Yazi/ --target=$HOME/ --stow /
```

### Neovim Plugin Management (Lazy.nvim)
```bash
# Within Neovim, use these commands:
:Lazy sync          # Update and install plugins
:Lazy update        # Update all plugins
:Lazy clean         # Remove unused plugins
:Lazy health        # Check plugin health
:Lazy profile       # View startup performance
```

### Yazi File Manager
Key navigation commands configured:
- `y` - Copy files
- `d` - Cut files  
- `p` - Paste files
- `space` - Toggle file selection
- `gg` / `G` - Go to top/bottom
- `.` - Toggle hidden files

## Architecture Overview

### Repository Structure
```
SetupFiles/
├── Brewfile                 # Homebrew packages and applications
├── stowdotfiles.sh         # Deployment script using GNU Stow
├── nvim/                   # Neovim configuration
│   └── .config/nvim/
├── Warp/                   # Warp terminal configuration
│   └── .warp/
└── Yazi/                   # Yazi file manager configuration
    └── .config/yazi/
```

### Stow-based Deployment Philosophy
- **Symlink Management**: GNU Stow creates symlinks from repository to `$HOME`
- **Modular Organization**: Each tool has its own directory with proper `.config/` structure
- **Version Control**: All configurations tracked in git, deployed via symlinks
- **Easy Updates**: Changes in repo immediately reflect in active configurations

### Configuration Philosophy
- **Tool-specific Isolation**: Each tool's configuration is self-contained
- **Modular Design**: Neovim plugins organized by functionality
- **Maintainable Structure**: Clear separation between core settings and plugin configurations
- **Performance Focused**: Lazy loading and optimized startup times

## Neovim Configuration

### Lua Module Structure
```
nvim/.config/nvim/
├── init.lua                 # Entry point, loads core and lazy
├── lua/sam/
│   ├── core/
│   │   ├── init.lua        # Loads core modules
│   │   ├── options.lua     # Vim options and settings
│   │   ├── keymaps.lua     # Core keybindings
│   │   └── autocmds.lua    # Autocommands
│   ├── plugins/            # Plugin configurations
│   │   ├── lsp/           # LSP-specific plugins
│   │   │   ├── mason.lua  # LSP installer
│   │   │   └── lspconfig.lua # LSP configurations
│   │   └── [plugin].lua   # Individual plugin configs
│   └── lazy.lua           # Lazy.nvim setup and plugin loading
```

### Key Components
- **Leader Key**: Set to `<space>`
- **Core Keymaps**: Window management, tab operations, text manipulation
- **LSP Integration**: Mason for LSP management, full language server support
- **Plugin Management**: Lazy.nvim with automatic plugin loading
- **UI Enhancements**: Lualine, Telescope, TreeSitter syntax highlighting
- **Git Integration**: Gitsigns and LazyGit for version control workflows

### Important Keybindings
- `<leader>ff` - Telescope file finder
- `<leader>fs` - Telescope live grep
- `<leader>sv` - Split window vertically
- `<leader>sx` - Close current split
- `jk` - Exit insert mode

## Warp Terminal Configuration

### Custom Keybindings
Key customizations in `keybindings.yaml`:
- **AI Assistant**: `cmd-enter` for accepting AI query suggestions
- **Subshell Management**: `ctrl-shift-W` for warpify subshell
- **Disabled Shortcuts**: Several default shortcuts disabled for workflow optimization

### Terminal Workflow Integration
- **Agent Mode**: Configured for seamless AI assistant interaction
- **Block-based Interaction**: Optimized for Warp's command block paradigm
- **Copy Operations**: Streamlined copy commands for terminal output

### Launch Configurations
Pre-configured launch environments:
- **GitHub CLI**: Opens in `~/Dev/Github` directory for repository work
- **PowerShell**: Opens in home directory for cross-platform scripting

## Yazi File Manager Configuration

### Display and Navigation Settings
- **Layout Ratios**: `[1, 2, 3]` for optimal three-pane view
- **Sorting**: Alphabetical with directories first
- **Hidden Files**: Configurable visibility with smart defaults
- **Mouse Support**: Click and scroll events enabled

### Plugin Ecosystem
- **Git Integration**: Real-time git status display in file listings
- **File Metadata**: Enhanced file information and previews
- **Border Styling**: Custom border plugins for visual clarity

### Preview System
Comprehensive file type support:
- **Code Files**: Syntax highlighted previews
- **Images**: Thumbnail generation and preview
- **Archives**: Content listing for compressed files  
- **Documents**: PDF and office document previews
- **Media**: Video thumbnails and metadata

## Development Workflows

### Initial Setup
```bash
# 1. Clone repository
git clone <repo-url> ~/Dev/SetupFiles

# 2. Install Homebrew packages
cd ~/Dev/SetupFiles
brew bundle

# 3. Deploy dotfiles
./stowdotfiles.sh

# 4. Launch Neovim to initialize plugins
nvim
# In Neovim: :Lazy sync
```

### Configuration Updates
```bash
# 1. Edit configurations in repository
nvim ~/Dev/SetupFiles/nvim/.config/nvim/lua/sam/plugins/[plugin].lua

# 2. Changes are immediately active (via symlinks)
# 3. Test configuration in new terminal/nvim session

# 4. Commit changes
cd ~/Dev/SetupFiles
git add -A
git commit -m "Update [tool] configuration: [description]"
```

### Adding New Tools
```bash
# 1. Create tool directory with proper structure
mkdir -p ~/Dev/SetupFiles/NewTool/.config/newtool

# 2. Add configuration files
cp ~/.config/newtool/* ~/Dev/SetupFiles/NewTool/.config/newtool/

# 3. Add stow command to stowdotfiles.sh
echo 'stow -v --dir=$HOME/Dev/SetupFiles/NewTool/ --target=$HOME/ --stow /' >> stowdotfiles.sh

# 4. Test deployment
stow -v --dir=$HOME/Dev/SetupFiles/NewTool/ --target=$HOME/ --stow /
```

### Troubleshooting
- **Stow Conflicts**: Remove existing configs before initial stow deployment
- **Neovim Plugin Issues**: Use `:Lazy health` to diagnose problems
- **Broken Symlinks**: Re-run stowdotfiles.sh to recreate links
- **Missing Dependencies**: Check Homebrew installation with `brew doctor`

## References

- [Warp Terminal Documentation](https://docs.warp.dev/)
- [Neovim Configuration Guide](https://neovim.io/doc/)
- [Lazy.nvim Plugin Manager](https://github.com/folke/lazy.nvim)
- [Yazi File Manager](https://github.com/sxyazi/yazi)
- [GNU Stow Manual](https://www.gnu.org/software/stow/manual/stow.html)
- [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle)
