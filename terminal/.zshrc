# This file goes in your Home (~) directory.
autoload -Uz compinit
compinit

# See: man zshmisc : SIMPLE PROMPT ESCAPES
# Default PROMPT='%n@%m %1~ %# '
# Bold, White, Time [HH:mm], Space, Cyan Username, Standard Color @, Dark Green Host:, Yellow Current Working Directory
PROMPT='%B%F{white}%T%b%f %F{cyan}%n%f@%m:%F{yellow}%~%f %# '

fpath=(~/.zsh $fpath)

# zstyle ':completion:*:*:git:*' script ~/git-completion.bash

# auto-completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi
