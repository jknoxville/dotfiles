### Oh-my-zsh Config

export ZSH=/Users/knoxjohn/.oh-my-zsh

ZSH_THEME="jknognoster"        # Oh-my-zsh theme
export UPDATE_ZSH_DAYS=14      # Oh-my-zsh auto-update frequency 
COMPLETION_WAITING_DOTS="true" # Show auto-complete status indicator
HIST_STAMPS="yyyy-mm-dd"       # HISTORY timestamp format
plugins=(git)                  # Oh-my-zsh plugins

source $ZSH/oh-my-zsh.sh

### Personal Config

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export EDITOR=vi

# vim-style keybindings
set -o vi

# Aliases
alias zshrc="$EDITOR ~/.zshrc"

### Work Config
source ~/dotfiles/amazon/.amazon.zshrc.sh

