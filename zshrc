ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="agnoster"

export ZSH="/home/jan/.oh-my-zsh"
export DEFAULT_USER=jan
export EDITOR=/usr/sbin/nvim

plugins=(
  git, ssh-agent
)

source $ZSH/oh-my-zsh.sh

eval `dircolors ~/.dircolors`

alias l='ls -lAFh'
alias vim=nvim
