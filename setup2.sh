#!/bin/bash
ln -s ~/dotfiles/dircolors ~/.dircolors
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.old
fi
ln -s ~/dotfiles/zshrc ~/.zshrc

if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.old
fi
ln -s ~/dotfiles/vimrc ~/.vimrc

mkdir -p ~/local/share/nvim/plugged
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/terminator
ln -s ~/dotfiles/terminator.config ~/.config/terminator/config

mkdir -p ~/.fonts
ln -s ~/dotfiles/Hack-Regular.ttf ~/.fonts/Hack-Regular.ttf
