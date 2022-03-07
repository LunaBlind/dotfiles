alias b='echo -e "enter brightness:\n"; read val; xrandr  --output eDP-1 --brightness "${val}"'
alias bm='echo -e "enter brightness:\n"; read val; xrandr  --output HDMI-1 --brightness "${val}"'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias feh='feh --start-at'

#git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias mount='udisksctl mount -b'
alias umount='udisksctl unmount -b'

