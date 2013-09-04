#!/bin/bash

git clone git://github.com/kuyseng/dotfiles.git ~/.dotfiles

ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/gvimrc ~/.gvimrc

ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/bash_aliases ~/.bash_aliases
ln -s ~/.dotfiles/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/irbrc ~/.irbrc
ln -s ~/.dotfiles/gemrc ~/.gemrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/ackrc ~/.ackrc

ln -s ~/.dotfiles/zshrc ~/.zshrc

ln -s ~/.dotfiles/tmuxinator/ ~/.tmuxinator

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
