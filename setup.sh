#!/bin/bash
OS=`cat /etc/os-release | grep ID= | awk -F '=' '{print $2}'`

if [ $OS = "arch" ]; then
  sudo pacman -S git zsh neovim terminator
else
  #sudo apt-get install git zsh neovim terminator
  echo "Only Arch support as of now."
  exit
fi

ln -s ~/dotfiles2/dircolors ~/.dircolors
ln -s ~/dotfiles2/gitconfig ~/.gitconfig
ln -s ~/dotfiles2/tmux.conf ~/.tmux.conf

if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.old
fi
ln -s ~/dotfiles2/zshrc ~/.zshrc

if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.old
fi
ln -s ~/dotfiles2/vimrc ~/.vimrc

mkdir -p ~/local/share/nvim/plugged
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/dotfiles2/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/terminator
ln -s ~/dotfiles2/terminator.config ~/.config/terminator/config

mkdir -p ~/.fonts
ln -s ~/dotfiles2/Hack-Regular.ttf ~/.fonts/Hack-Regular.ttf
