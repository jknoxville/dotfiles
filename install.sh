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

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Installing vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Already installed: Vundle"
fi

echo ""
echo "All done"
