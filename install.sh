#!/bin/bash
set -o nounset
set -o errexit

function archive {
    if [ -f $1 ];
        then mv ~/$1 ~/dotfiles/$1.old && echo "Existing $1 moved to ~/dotfiles/$1.old";
    fi
}

function replace {
    archive $1
    echo "Symlinking $1"
    ln -sf ~/dotfiles/$1 ~/$1
}

echo "Installing custom theme. You need a powerline font for this, like Meslo LG M DZ Regular for Powerline"
echo "Good colour schemes are SolarizedDark, and BirdsOfParadise"
ln -sf ~/dotfiles/oh-my-zsh/jknognoster.zsh-theme ~/.oh-my-zsh/themes/

replace .zshrc
replace .vimrc

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Installing vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo ""
echo "All done"
