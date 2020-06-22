#!/bin/bash
set -o nounset
set -o errexit

function archive {
    if [ -f ~/$1 ];
        then mv ~/$1 ~/dotfiles/$1.old && echo "Existing $1 moved to ~/dotfiles/$1.old";
    fi
}

function replace {
    if [ -L ~/$1 ] && [ $(readlink ~/$1) = ~/dotfiles/$1 ]; then
        echo "Already up to date: $1."
    else
        archive $1
        echo "Symlinking $1"
        ln -sf ~/dotfiles/$1 ~/$1
    fi
}

# Installing custom theme. You need a powerline font for this, like Meslo LG M DZ Regular for Powerline
# Good colour schemes are SolarizedDark, and BirdsOfParadise
replace .oh-my-zsh/themes/jknognoster.zsh-theme
replace .zshrc
replace .vimrc
replace .tmux.conf

if [ -d ~/.vim/pack/dist/start/vim-airline ]; then
    echo "Already installed: vim-airline";
else
    echo "Installing  vim-airline"
    mkdir -p ~/.vim/pack/dist/start
    git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
fi

if [ -d ~/.vim/bundle/ctrlp.vim ]; then
    echo "Already installed: vim Ctrl-P"
else
    echo "Installing Vim Ctrl-P"
    git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
fi

echo ""
echo "All done"
