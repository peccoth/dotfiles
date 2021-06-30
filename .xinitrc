#!/bin/sh

userresources=$HOME/.config/Xresources
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

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

mpd &
picom -bc -i 1 &
setxkbmap pl &
feh --bg-fill --no-fehbg "/home/kacper/.local/wallpapers/$(ls /home/kacper/.local/wallpapers/ | sort -R | tail -1)"
dunst &
slstatus &
xinput --set-prop 15 'Coordinate Transformation Matrix' 0.3 0 0 0 0.3 0 0 0 1 &
exec dwm
