# This file goes in your Home (~) directory.
export SVN_EDITOR=nano
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/Caskroom/packetsender:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$(brew --prefix)/bin:$PATH"
export PATH="$(brew --prefix)/opt/bin:$PATH"
export PATH=/opt/arcanist/bin:/opt/local/sbin:${PATH}
export PATH="/usr/local/opt/curl/bin:$PATH"

# Android SDK Tools
export PATH=~/android-sdks/build-tools/30.0.2:${PATH}
export PATH=~/android-sdks/tools:${PATH}
export PATH=~/android-sdks/platform-tools:${PATH}

# Android Studio + Gradle JDK Location
# Example Mac OS Locations:
# /Applications/Android Studio.app/Contents/jre/jdk/Contents/Home
# /Applications/Android Studio.app/Contents/jre/Contents/Home
# /Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
export PATH="/Applications/Android Studio.app/Contents/jre/Contents/Home/bin:$PATH"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"

# Python
export PYTHONPATH=/usr/local/bin:${PYTHONPATH}

alias wip='git commit -a -m WIP'
alias squish='git status && git commit -a --amend -C HEAD'
alias ls='ls -lahGF'

# See: https://support.apple.com/en-us/HT208050
# See: man zshmisc : SIMPLE PROMPT ESCAPES
# Default PROMPT='%n@%m %1~ %# '
# Bold, White, Time [HH:mm], Space, Cyan Username, Standard Color @, Dark Green Host:, Yellow Current Working Directory
PROMPT='%B%F{white}%T%b%f %F{cyan}%n%f@%m:%F{yellow}%~%f %# '

CLICOLOR=1
LSCOLORS=ExFxBxDxCxegedabagacad

# if [ -f /opt/arcanist/resources/shell/bash-completion ]; then
#   . /opt/arcanist/resources/shell/bash-completion
# fi
