#!/bin/bash
set -o nounset
set -o errexit

echo "Installing custom theme. You need a powerline font for this, like Meslo LG M DZ Regular for Powerline"
echo "Good colour schemes are SolarizedDark, and BirdsOfParadise"
ln -s ~/dotfiles/oh-my-zsh/jknognoster.zsh-theme ~/.oh-my-zsh/themes/

if [ -f ~/.zshrc ];
then mv ~/.zshrc ~/dotfiles/.zshrc.old && echo "Existing .zshrc moved to ~/dotfiles/.zshrc.old";
fi

echo "Symlinking .zshrc"
ln -s ~/dotfiles/.zshrc ~/.zshrc 

echo "Symlinking .vimrc"
ln -s ~/dotfiles/.vimrc ~/.vimrc

if [ ! -f ~/.vim/bundle/Vundle.vim ];
echo "Installing vundle"
then git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo ""
echo "All done"
