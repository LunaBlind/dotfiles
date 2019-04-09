#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export SUDO_EDITOR=vim
alias ts3client="/opt/TeamSpeak3-Client-linux_amd64/ts3client_runscript.sh"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ssh='ssh nika@192.168.0.5' 

#git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

PS1='[\u@\h \W]\$ '

export TERM=xterm-256color
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
# export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
# source /usr/bin/virtualenvwrapper.sh

alias mount='udisksctl mount -b'
alias umount='udisksctl unmount -b'
# alias touchpad='sudo sh -c 'echo -n "elantech" > /sys/bus/serio/devices/serio1/protocol''
source /opt/ros/melodic/setup.bash
