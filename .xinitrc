#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# exec xrandr --output HDMI1 --auto --left-of eDP1 &
# exec xrandr --output HDMI1 --auto  &
# exec xrandr --output HDMI1 --primary &
# exec xrandr --dpi 144 &
exec $HOME/scripts/screens.sh &
exec nitrogen --restore &
exec --no-startup-id /usr/lib/geoclue-2.0/demos/agent &
exec --no-startup-id i3-battery-popup -n -L 5 &
# exec redshift -l 49:11 &
exec redshift &
# exec setxkbmap us &
# exec setxkbmap -option caps:escape &
# exec xmodmap ~/.Xmodmap &
exec nm-applet &
exec i3

