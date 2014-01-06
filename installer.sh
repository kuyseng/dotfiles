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
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global
rm ~/.oh-my-zsh/themes/aussiegeek.zsh-theme
ln -s ~/.dotfiles/oh-my-zsh/themes/aussiegeek.zsh-theme ~/.oh-my-zsh/themes/aussiegeek.zsh-theme

mv ~/.rvm/gemsets/global.gems ~/.rvm/gemsets/global.gems.original
ln -s ~/rvm/gemsets/global.gems ~/.rvm/gemsets/global.gems

ln -s ~/.dotfiles/tmuxinator/ ~/.tmuxinator
# customize chrome
cat ~/.dotfiles/chrome_custom.css >> ~/.config/chromium/Default/User\ StyleSheets/Custom.css
cat ~/.dotfiles/chrome_custom.css >> ~/.config/google-chrome/Default/User\ StyleSheets/Custom.css

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
