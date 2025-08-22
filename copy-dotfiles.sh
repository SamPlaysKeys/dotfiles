#!/bin/zsh

# Copy dotfiles script
# This script copies directories from ./dotfiles/ to their appropriate locations
# in the user's home directory (~/)

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if dotfiles directory exists
if [ ! -d "./dotfiles" ]; then
    print_error "dotfiles directory not found in current directory"
    exit 1
fi

# Create ~/.config if it doesn't exist
if [ ! -d "$HOME/.config" ]; then
    print_status "Creating ~/.config directory"
    mkdir -p "$HOME/.config"
fi

print_status "Starting dotfiles copy process..."

# Loop through each directory in ./dotfiles/
for dir in ./dotfiles/*/; do
    if [ -d "$dir" ]; then
        # Get the directory name without path
        dirname=$(basename "$dir")
        print_status "Processing $dirname..."
        
        # Check what's inside this directory
        subdirs=($(find "$dir" -mindepth 1 -maxdepth 1 -type d))
        
        if [ ${#subdirs[@]} -eq 0 ]; then
            print_warning "$dirname contains no subdirectories, skipping"
            continue
        fi
        
        # Check if the first subdirectory is .config
        first_subdir=$(basename "${subdirs[1]}")
        
        if [ "$first_subdir" = ".config" ]; then
            # Contents should go to ~/.config/
            print_status "$dirname contains .config directory, copying contents to ~/.config/"
            
            # Set null glob option to handle empty directories
            setopt NULL_GLOB
            
            # Loop through contents of the .config directory (including hidden files)
            config_items=("$dir/.config"/* "$dir/.config"/.*)
            # Filter out . and .. entries
            filtered_config_items=()
            for item in "${config_items[@]}"; do
                if [ -e "$item" ] && [[ "$(basename "$item")" != "." ]] && [[ "$(basename "$item")" != ".." ]]; then
                    filtered_config_items+=("$item")
                fi
            done
            
            if [ ${#filtered_config_items[@]} -gt 0 ]; then
                for config_item in "${filtered_config_items[@]}"; do
                    config_name=$(basename "$config_item")
                    target_path="$HOME/.config/$config_name"
                    
                    # Check if target already exists
                    if [ -e "$target_path" ]; then
                        backup_path="$HOME/.config/${config_name}.bak"
                        print_warning "$target_path already exists, backing up to $backup_path"
                        
                        # Remove existing backup if it exists
                        if [ -e "$backup_path" ]; then
                            rm -rf "$backup_path"
                        fi
                        
                        mv "$target_path" "$backup_path"
                        print_success "Backed up existing $config_name to ${config_name}.bak"
                    fi
                    
                    # Copy the new configuration
                    cp -r "$config_item" "$target_path"
                    print_success "Copied $config_name to ~/.config/"
                done
            else
                print_warning "$dirname/.config directory is empty, nothing to copy"
            fi
            
            # Unset null glob option
            unsetopt NULL_GLOB
        else
            # Directory should be copied directly to ~/
            print_status "$dirname does not contain .config, copying contents directly to ~/"
            
            # Set null glob option to handle empty directories
            setopt NULL_GLOB
            
            # Loop through contents of the directory (including hidden files)
            items=("$dir"/* "$dir"/.*)
            # Filter out . and .. entries
            filtered_items=()
            for item in "${items[@]}"; do
                if [ -e "$item" ] && [[ "$(basename "$item")" != "." ]] && [[ "$(basename "$item")" != ".." ]]; then
                    filtered_items+=("$item")
                fi
            done
            
            if [ ${#filtered_items[@]} -gt 0 ]; then
                for item in "${filtered_items[@]}"; do
                    item_name=$(basename "$item")
                    target_path="$HOME/$item_name"
                    
                    # Check if target already exists
                    if [ -e "$target_path" ]; then
                        backup_path="$HOME/${item_name}.bak"
                        print_warning "$target_path already exists, backing up to $backup_path"
                        
                        # Remove existing backup if it exists
                        if [ -e "$backup_path" ]; then
                            rm -rf "$backup_path"
                        fi
                        
                        mv "$target_path" "$backup_path"
                        print_success "Backed up existing $item_name to ${item_name}.bak"
                    fi
                    
                    # Copy the new item
                    cp -r "$item" "$target_path"
                    print_success "Copied $item_name to ~/"
                done
            else
                print_warning "$dirname directory is empty, nothing to copy"
            fi
            
            # Unset null glob option
            unsetopt NULL_GLOB
        fi
        
        echo  # Empty line for readability
    fi
done

print_success "Dotfiles copy process completed!"
print_status "Remember to restart your terminal or source your shell configuration for changes to take effect."
