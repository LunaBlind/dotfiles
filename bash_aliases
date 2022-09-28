alias b='echo -e "enter brightness:\n"; read val; xrandr  --output eDP-1 --brightness "${val}"'
alias bm='echo -e "enter brightness:\n"; read val; xrandr  --output HDMI-1 --brightness "${val}"'

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto'
alias lsl='ls -lash --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto'
alias cp='cp -i'
alias df='df -h'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias feh='feh --start-at'

#git
# alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias mount='udisksctl mount -b'
alias umount='udisksctl unmount -b'

# cpupower
alias powersave='sudo cpupower frequency-set -g powersave &&
				sudo cpupower set -b 6'
alias performance='sudo cpupower frequency-set -g performance &&
				sudo cpupower set -b 0'
alias gaming='sudo cpupower frequency-set -g performance &&
				sudo cpupower set -b 0 &&
				sudo sysctl kernel.unprivileged_userns_clone=1'
alias nogaming='sudo cpupower frequency-set -g powersave &&
				sudo cpupower set -b 6 &&
				sudo sysctl kernel.unprivileged_userns_clone=0'

# games
alias ck3='steam -applaunch 1158310'
alias eu4='steam -applaunch 236850'
alias stellaris='steam -applaunch 281990'
alias hoi='steam -applaunch 394360'
alias imperator='steam -applaunch 859580'

# headset
alias headset='bluetoothctl power on &&
				bluetoothctl connect 60:AB:D2:3D:2A:51'

# misc
alias shutdown='bluetoothctl power off && shutdown now'

alias vlime='sbcl --load ~/.local/share/nvim/plugged/vlime/lisp/start-vlime.lisp'
