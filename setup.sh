#!/bin/bash
OS=`cat /etc/os-release | grep ID= | awk -F '=' '{print $2}'`

if [ $OS = "arch" ]; then
  sudo pacman -S git zsh neovim terminator
else
  #sudo apt-get install git zsh neovim terminator
  echo "Only Arch support as of now."
  exit

ln -s ~/.dircolors ./dircolors
ln -s ~/.gitconfig ./gitconfig
ln -s ~/.tmux.conf ./tmux.conf

if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.old
fi
ln -s ~/.zshrc ./zshrc

if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.old
fi
ln -s ~/.vimrc ./vimrc

mkdir -p ~/local/share/nvim/plugged
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/.config/nvim/init.vim ./init.vim

mkdir -p ~/.config/terminator
ln -s ~/config/terminator/config ./terminator.config

mkdir -p ~/.fonts
ln -s ~/.fonts/Hack-Regular.ttf ./Hack-Regular.ttf

