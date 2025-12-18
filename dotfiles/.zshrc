# ~/.zshrc - Zsh configuration file

# Initialize Homebrew 
eval "$(/opt/homebrew/bin/brew shellenv)"

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Directory navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# Completion system
autoload -Uz compinit
compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Color support
autoload -U colors && colors

# Basic prompt (you can customize this)
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '

# Aliases
alias ll='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'

# Environment variables
export EDITOR=nvim
export PAGER=less

# Load any local customizations
if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# SSH Agent Configuration for GitHub
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
fi

# Ensure GitHub SSH key is loaded
if ! ssh-add -l 2>/dev/null | grep -q "github-sfleming-mac"; then
    ssh-add ~/.ssh/id_rsa_github > /dev/null 2>&1
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/sfadmin/.lmstudio/bin"
# End of LM Studio CLI section

# Ensure Homebrew's Python is used
export PATH="/opt/homebrew/bin/python3:$PATH"

# Created by `pipx` on 2025-11-06 17:59:27
export PATH="$PATH:/Users/sfadmin/.local/bin"

# Created manually for OpenShift Local on 2025-12-2 13:40:35
export PATH="/Users/sfadmin/.crc/bin/oc:$PATH"

