export SVN_EDITOR=nano
export PATH=$(brew --prefix)/bin:/opt/arcanist/bin:/opt/local/sbin:~/android-sdks/tools:~/android-sdks/platform-tools:${PATH}
export PYTHONPATH=/usr/local/bin:${PYTHONPATH}

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

alias wip='git commit -a -m WIP'
alias squish='git status && git commit -a --amend -C HEAD'
alias ls='ls -lahGF'

export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

export PS1="\[$COLOR_WHITE\]\D{%H:%M}\[$COLOR_NC\] \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
# export PROMPT_COMMAND="echo -n $'\e[37m'\[$(date +%H:%M)\]"
# export PROMPT_COMMAND="echo -ne \[$(date +%H:%M)\]"

source ~/git-completion.bash

if [ -f /opt/arcanist/resources/shell/bash-completion ]; then
  . /opt/arcanist/resources/shell/bash-completion
fi
