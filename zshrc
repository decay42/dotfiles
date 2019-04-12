# Fix for permission warning
ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="agnoster"   # "powerlevel9k/powerlevel9k" #"
# POWERLEVEL9K_MODE='awesome-fontconfig'
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
# POWERLEVEL9K_VCS_GIT_ICON=$'\uf113'
# POWERLEVEL9K_STATUS_VERBOSE=false
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
# POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
#
# Path to your oh-my-zsh installation.
export ZSH="/home/jan/.oh-my-zsh"
export EDITOR=/usr/sbin/nvim
export DEFAULT_USER=jan

export DISABLE_AUTO_TITLE='true'
export PATH=/home/jan/.local/bin:$PATH
export PATH=$(ruby -e 'puts Gem.user_dir')/bin:$PATH

plugins=(git) #ssh-agent)

zstyle :omz:plugins:ssh-agent agent-forwarding on

source $ZSH/oh-my-zsh.sh
source /home/jan/.bin/tmuxinator.zsh
git_prompt_info() {}

# NVM, comment out the following line to disable
#source /usr/share/nvm/init-nvm.sh

# local config
if [[ -e ~/.local_dotfile ]]; then
  source ~/.local_dotfile
fi

eval `dircolors ~/.dircolors`

alias l='ls -lFh'
alias ll='ls -lFAh'
alias k='k -Ah --no-vcs'
alias vim=nvim
alias wttr='curl de.wttr.in/Magdeburg'

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

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
  echo "Initialising new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

  if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
      start_agent;
    }
else
  start_agent;
fi
