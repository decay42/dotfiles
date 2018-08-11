#!/bin/bash
OS=`cat /etc/os-release | grep ID= | awk -F '=' '{print $2}'`

if [ $OS = "arch" ]; then
  sudo pacman -S git zsh neovim terminator
else
  #sudo apt-get install git zsh neovim terminator
  echo "Only Arch support as of now."
  exit
fi

ln -s ./dircolors ~/.dircolors
ln -s ./gitconfig ~/.gitconfig
ln -s ./tmux.conf ~/.tmux.conf

if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.old
fi
ln -s ./zshrc ~/.zshrc

if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.old
fi
ln -s ./vimrc ~/.vimrc

mkdir -p ~/local/share/nvim/plugged
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ./init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/terminator
ln -s ./terminator.config ~/.config/terminator/config

mkdir -p ~/.fonts
ln -s ./Hack-Regular.ttf ~/.fonts/Hack-Regular.ttf

