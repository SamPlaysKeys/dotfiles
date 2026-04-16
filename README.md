# ✨ SetupFiles ✨

## Overview

This repository contains my personal development environment configuration files and setup scripts for **macOS**, **Debian**, and **RedHat**. The setup focuses on creating an efficient, modern development workflow centered around **Neovim**, **Yazi**, and **Zsh**.

## Dotfiles Location

All of the actual configuration files are cleanly organized inside the `dotfiles/` directory.

- **`dotfiles/zshrc`**: Zsh configuration.
- **`dotfiles/gitconfig`**: Git configuration.
- **`dotfiles/config/`**: App-specific configs meant to be symlinked to `~/.config/` (e.g., Neovim, Yazi).

> **Note:** For details on how the Neovim configuration is structured, see the [Neovim README](dotfiles/config/nvim/README.md).

## Requirements

Before running the automated setup, ensure you have the following:

- **Ansible**: Install via your package manager (e.g., `brew install ansible`, `sudo apt install ansible`, or `sudo dnf install ansible`).
- **User Account**: **Do not run as root.** The playbooks are designed to run as a normal user and will manage home directory mappings accordingly. You will be prompted for your sudo password when system-level installations are required.

## Automated Setup with Ansible

The automation logic, playbooks, and roles have been organized into the `ansible/` directory. 

### 1. Install Ansible Requirements

First, navigate to the `ansible/` directory and install the required Ansible collections:

```bash
cd ansible
ansible-galaxy collection install -r requirements.yml
```

### 2. Run a Playbook

While in the `ansible/` directory, you can run any of the available playbooks. Use the `-K` (or `--ask-become-pass`) flag so Ansible can securely install system dependencies using `sudo`.

- **Complete Setup:** Installs everything (apps, dependencies, neovim, yazi, zsh, fonts, etc.).
  ```bash
  ansible-playbook Complete_Setup.yml -K
  ```
- **Install Recommended Apps:** Installs recommended terminal tools and core configurations.
  ```bash
  ansible-playbook Install_Recommended_Apps.yml -K
  ```
- **Neovim & Yazi Setup Only:** Installs only the dependencies, fonts, and configurations required for Neovim and Yazi.
  ```bash
  ansible-playbook Neovim_Setup.yml -K
  ```

### Selective Execution (Using Tags)

If you only want to run specific parts of a playbook, you can use tags:

- **Install Dependencies**: `ansible-playbook Complete_Setup.yml -K --tags dependencies`
- **Setup Zsh**: `ansible-playbook Complete_Setup.yml -K --tags zsh`
- **Setup Neovim**: `ansible-playbook Complete_Setup.yml -K --tags neovim`
- **Setup Yazi**: `ansible-playbook Complete_Setup.yml -K --tags yazi`
- **Only Symlinks**: `ansible-playbook Complete_Setup.yml --tags config`

## What's Included

- **NeoVim**: Complete IDE-like configuration with LSP and modern plugins.
- **Zsh**: Custom `.zshrc` with aliases and environment settings.
- **Yazi**: Blazing fast terminal file manager configuration.
- **Warp**: Terminal themes and configurations.
- **LazyGit**: A simple terminal UI for git commands.

---

*This setup is optimized for macOS and Linux (Debian/RedHat) development workflows.*
