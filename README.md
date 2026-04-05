✨ **SetupFiles** ✨

## Overview

This repository contains my personal development environment configuration files and setup scripts for **macOS**, **Debian**, and **RedHat**. The setup focuses on creating an efficient, modern development workflow centered around **Neovim**, **Yazi**, and **Zsh**.

## Automated Setup with Ansible

A `setup.yml` Ansible playbook is included to automate the installation of dependencies, Neovim, and Yazi, and to set up configuration files and symlinks.

### Prerequisites

- **Ansible**: Install via your package manager (e.g., `brew install ansible` or `sudo apt install ansible`).
- **User Account**: **Do not run as root.** The playbook is designed to run as a normal user and will manage home directory mappings accordingly.
- **Sudo Access**: You must have sudo privileges to install system dependencies and binaries.

### Running the Playbook

To run the full setup, use the `--ask-become-pass` (or `-K`) flag to provide your sudo password:

```bash
ansible-playbook setup.yml -K
```

### Selective Execution (Using Tags)

You can run specific parts of the setup using tags:

- **Install Dependencies**: `ansible-playbook setup.yml -K --tags dependencies`
- **Setup Zsh**: `ansible-playbook setup.yml --tags zsh`
- **Setup Neovim**: `ansible-playbook setup.yml -K --tags neovim`
- **Setup Yazi**: `ansible-playbook setup.yml -K --tags yazi`
- **Only Symlinks**: `ansible-playbook setup.yml --tags config`

## Manual Installation (macOS)

### 1. Homebrew & Applications
```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install everything from Brewfile
brew bundle install
```

### 2. Nerd Fonts
```bash
# Install Hack Nerd Font for Neovim and Yazi icons
cd ~/Library/Fonts && git clone https://github.com/SamPlaysKeys/hack-fonts.git
```

## What's Included

- **NeoVim**: Complete IDE-like configuration with LSP and modern plugins.
- **Zsh**: Custom `.zshrc` with aliases and environment settings.
- **Yazi**: Blazing fast terminal file manager configuration.
- **Warp**: Terminal themes and configurations.

---

*This setup is optimized for macOS and Linux (Debian/RedHat) development workflows.*
