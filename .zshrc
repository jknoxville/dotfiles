### Oh-my-zsh Config
# Commented out by default

export ZSH=~/.oh-my-zsh

# Custom theme only looks good with decent UI support.
# When that is available add a .use-custom-oh-my-zsh-theme file to $HOME
# to enable it, otherwise use the default.
if [ -f ~/.use-custom-oh-my-zsh-theme ]; then
    ZSH_THEME="jknognoster"
else;
    ZSH_THEME="robbyrussell"
fi;

export UPDATE_ZSH_DAYS=14      # Oh-my-zsh auto-update frequency 
COMPLETION_WAITING_DOTS="true" # Show auto-complete status indicator
HISTSIZE=100000
SAVEHIST=1000000000
plugins=(git)                  # Oh-my-zsh plugins

source $ZSH/oh-my-zsh.sh

### Personal Config

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin"

export EDITOR=vim

# Start up ssh-agent
eval `ssh-agent -s`

# vim-style keybindings
set -o vi
# vim bindings don't enable Ctrl-R by default. Re-enable it.
bindkey "^R" history-incremental-search-backward

# Aliases
alias zshrc="$EDITOR ~/.zshrc"
alias sz="source ~/.zshrc"
alias pwgen="openssl rand -base64 15"
alias gettime='date +%s'
alias ta="tmux -CC attach || tmux -CC" # -CC gives you native terminal support (iTerm2)
alias vi="vim"

# Delete branches that are merged into HEAD
alias gbc='git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d'

### Work Config
workconfig=~/dotfiles/amazon/amazon.zshrc
if [ -f "$workconfig" ]; then
  alias amazon.zshrc="$EDITOR $workconfig"
  source "$workconfig"
fi

# Include quick file completion
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"

# Open the latest (last modified) file with matching prefix
# E.g. latest tail -f myLogFile
latest () {
    $@[0,-2] $@[-1]*(om[1])
}

# Autojump ( https://github.com/wting/autojump )
# Usage: j <DIR>
#        jc <CHILD DIR>
# [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# 0 -- vanilla completion (abc => abc)
# # 1 -- smart case completion (abc => Abc)
# # 2 -- word flex completion (abc => A-big-Car)
# # 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

# Shift-TAB to go backwards in the autocomplete menu
bindkey '^[[Z' reverse-menu-complete
