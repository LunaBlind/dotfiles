#
# ~/.bashrc
#

export SUDO_EDITOR=nvim
export EDITOR=nvim
export VISUAL=nvim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PATH=$PATH:/home/nika/.local/bin
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
source /usr/bin/virtualenvwrapper.sh

set -o vi

/usr/bin/setxkbmap -option "caps:escape"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# # Fancy prompt
fg=('\[\e[0;30m\]' '\[\e[0;31m\]' '\[\e[0;32m\]' '\[\e[0;33m\]'
    '\[\e[0;34m\]' '\[\e[0;35m\]' '\[\e[0;36m\]' '\[\e[0;37m\]'
    '\[\e[1;30m\]' '\[\e[1;31m\]' '\[\e[1;32m\]' '\[\e[1;33m\]'
    '\[\e[1;34m\]' '\[\e[1;35m\]' '\[\e[1;36m\]' '\[\e[1;37m\]')
nofg='\[\e[0m\]'

# if tmux is executable, X is running, and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ]; then
	# [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}
	[ -z "$TMUX"  ] && { exec tmux new-session && exit;}
fi
