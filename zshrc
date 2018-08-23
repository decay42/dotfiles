# Fix for permission warning
ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="agnoster"

# Path to your oh-my-zsh installation.
export ZSH="/home/jan/.oh-my-zsh"
export EDITOR=/usr/sbin/nvim
export DEFAULT_USER=jan

plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

# NVM, comment out the following line to disable
source /usr/share/nvm/init-nvm.sh

# local config
if [[ -e ~/.local_dotfile ]]; then
  source ~/.local_dotfile
fi

eval `dircolors ~/.dircolors`

alias l='ls -lAFh'
alias vim=nvim

# Random stuff from fancy zshrc
autoload -U compinit url-quote-magic
compinit

setopt AUTO_CD
setopt AUTO_PUSHD
setopt GLOB_COMPLETE
setopt PUSHD_MINUS
setopt NO_CASE_GLOB
setopt EXTENDED_GLOB
setopt ZLE

zle -N self-insert url-quote-magic

# Faster! (?)
zstyle ':completion::complete:*' use-cache 1

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete
zstyle ':completion:*' completer _expand _force_rehash _complete _approximate _ignored

# generate descriptions with magic.
zstyle ':completion:*' auto-description 'specify: %d'

# Don't prompt for a huge list, page it!
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Don't prompt for a huge list, menu it!
zstyle ':completion:*:default' menu 'select=0'

# Have the newer files last so I see them first
zstyle ':completion:*' file-sort modification reverse

# color code completion!!!!  Wohoo!
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1  # Because we didn't really complete anything
}

DIRSTACKSIZE=9
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
