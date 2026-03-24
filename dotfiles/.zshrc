# ~/.zshrc - Zsh configuration file

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

# Yazi launcher with cd
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Uncomment to use Oh-my-zsh
# export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="bira"
# plugins=(git)
#
# source $ZSH/oh-my-zsh.sh

# LazyGit Aliases
alias LazyGit='lazygit'
alias gi='lazygit'
alias lg='lazygit'

# Initialize Homebrew 
eval "$(/opt/homebrew/bin/brew shellenv)"

# SSH Agent Configuration for GitHub
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
fi
