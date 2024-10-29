autoload -U promptinit; promptinit 
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# ZSH=~/.oh-my-zsh/
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Untracked git files aren't counted as 'dirty' anymore
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.zsh/

# plugins=(git auto-notify zsh-autosuggestions shrink-path)
plugins=(git auto-notify zsh-autosuggestions zsh-syntax-highlighting)
# plugins=(git auto-notify )
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/bin/
# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
# export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
# source /usr/bin/virtualenvwrapper.sh

export ROS_DOMAIN_ID=42
# source /opt/ros/iron/setup.zsh
source /opt/ros/iron/setup.zsh
# source "$HOME/fav/ros2/install/local_setup.zsh"
source ~/fav/ros2/install/setup.zsh
source ~/fav/ros2_underlay/install/setup.zsh
#
# argcomplete for ros2 & colcon
eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"


# {{{ alias setup
if [ -f ~/.zsh/zshalias ]; then
    source ~/.zsh/zshalias
else
    print "404: ~/.zsh/zshalias not found."
fi
# }}}

# export TERM=xterm-256color
# source /opt/ros/noetic/setup.zsh
# source ~/ardrone_ws/devel/setup.zsh

/usr/bin/setxkbmap -option "caps:escape"

bindkey -v
# Enable bash like history search
bindkey '^R' history-incremental-search-backward

# Ctrl-w - delete a full WORD (including colon, dot, comma, quotes...)
my-backward-kill-word () {
    # Add colon, comma, single/double quotes to word chars
    # local WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>:,"'"'"
    local WORDCHARS=${WORDCHARS/\//}
    zle -f kill # Append to the kill ring on subsequent kills.
    zle backward-kill-word
}
zle -N my-backward-kill-word
bindkey '^w' my-backward-kill-word

export KEYTIMEOUT=1

# Not sure if necessary anymore
set -o vi

# source /usr/share/fzf/completion.zsh
# source /usr/share/fzf/key-bindings.zsh

# if tmux is executable, X is running, and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ]; then
	# [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}
	[ -z "$TMUX"  ] && { exec tmux new-session && exit;}
fi

# {{{ zsh options
# Spell check commands and offer correction (pdw > pwd)
setopt correct

# Turn off all beeps
unsetopt BEEP
setopt no_beep

# http://zsh.sourceforge.net/Intro/intro_6.html
DIRSTACKSIZE=8

# Perform cd if command is directory.
setopt auto_cd

# Make cd push the old directory onto the directory stack.
setopt auto_pushd

# Do not push multiple copies of the same directory onto the directory stack.
setopt pushd_ignore_dups

# No pushd messages
setopt pushd_silent

# Disable mail checking: use mail client instead
export MAILCHECK=0

# Disable flow control
stty -ixon

# {{{ History configuration
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=1000000
setopt incappendhistory
# setopt sharehistory
# Write to the history file immediately, not when the shell exits.
setopt INC_APPEND_HISTORY
# Don't record an entry that was just recorded again.
setopt HIST_IGNORE_DUPS
# Remove superfluous blanks before recording entry.
setopt HIST_REDUCE_BLANKS
# Don't store lines beginning with a space
setopt HIST_IGNORE_SPACE
alias history='history -i'
# }}}

# }}}

# {{{ auto-notify plugin configuration
export AUTO_NOTIFY_THRESHOLD=600
export AUTO_NOTIFY_TITLE="%command: done with %exit_code"
export AUTO_NOTIFY_BODY="Elapsed time: %elapsed seconds"
export AUTO_NOTIFY_WHITELIST=("pacman" "docker" "rsync" "scp" "cp" "mv" "rm" "git"
                              "cmake" "catkin_make" "make" "ninja" "dune"
                              "cabal" "yay" "apt"
                              "borg-linux64" "aria2" "frama-c"
                              "chk1" "cppcheck" "perf" "mprof" "svn" "opam" "sync-ebook.sh")
export AUTO_NOTIFY_IGNORE=("docker exec" "docker-compose")
export AUTO_NOTIFY_EXPIRE_TIME=2000
# }}}

# # {{{ Plugins
# if [[ ! -f ~/.zplug/init.zsh ]]; then
# 	git clone https://github.com/b4b4r07/zplug ~/.zplug
# fi

# if [[ -f ~/.zplug/init.zsh ]] ; then
#     source ~/.zplug/init.zsh

#     # Autosuggestions
#     zplug "tarruda/zsh-autosuggestions", use:"zsh-autosuggestions.zsh"

#     # Syntax highlighting
#     zplug "zdharma/fast-syntax-highlighting", defer:3

#     # Color parens and highlight matching paren
#     export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

#     # A plugin to shrink directory paths for brevity and pretty-printing
#     zplug "plugins/shrink-path", from:oh-my-zsh

#     # Automatically sends out a notification when a long running task has completed
# 	zplug "MichaelAquilina/zsh-auto-notify", defer:2

#     # Install plugins if not all are installed
#     if ! zplug check; then
#         zplug install
#     fi

#     # Source plugins and add commands to $PATH
#     zplug load
# fi

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

zstyle ':completion:*' menu select

# autoload -Uz compinit promptinit
# compinit
# promptinit
# End of lines added by compinstall

# # {{{ Show current directory in the X window title
# function set-title-precmd() {
#   printf "\e]2;%s\a" "${PWD/#$HOME/~} - zsh"
# }
# function set-title-preexec() {
#   printf "\e]2;%s\a" "$1 - zsh"
# }

# autoload -Uz add-zsh-hook
# add-zsh-hook precmd set-title-precmd
# add-zsh-hook preexec set-title-preexec
#
# source ~/pdfjam-completion.zsh
# # Enable argcomplete for specific commands
# eval "$(register-python-argcomplete pip)"
# eval "$(register-python-argcomplete pacman)"
# eval "$(register-python-argcomplete zathura)"
# # }}}
# vim:foldmethod=marker:foldenable:foldlevel=0:sw=4:tw=120
