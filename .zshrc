### Oh-my-zsh Config
# Commented out by default

# export ZSH=/Users/knoxjohn/.oh-my-zsh

# ZSH_THEME="jknognoster"        # Oh-my-zsh theme
# export UPDATE_ZSH_DAYS=14      # Oh-my-zsh auto-update frequency 
# COMPLETION_WAITING_DOTS="true" # Show auto-complete status indicator
# HIST_STAMPS="yyyy-mm-dd"       # HISTORY timestamp format
# plugins=(git)                  # Oh-my-zsh plugins

# source $ZSH/oh-my-zsh.sh

### Personal Config

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export EDITOR=vi

# vim-style keybindings
set -o vi
# vim bindings don't enable Ctrl-R by default. Re-enable it.
bindkey "^R" history-incremental-search-backward

# Aliases
alias zshrc="$EDITOR ~/.zshrc"
alias sz="source ~/.zshrc"
alias pwgen="openssl rand -base64 15"
alias gettime='date +%s'

# Delete branches that are merged into HEAD
alias gbc='git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d'

### Work Config
workconfig="/home/knoxjohn/dotfiles/amazon/amazon.zshrc"
alias amazon.zshrc="$EDITOR $workconfig"
source "$workconfig"

