#!/bin/sh
userresources=$HOME/.config/X/Xresources
usermodmap=$HOME/.config/X/Xmodmap

setxkbmap pl &
# merge in defaults and keymaps

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
/home/kacper/.config/mpd/mpd_notification &
picom -bc -i 1 &
feh --bg-fill --no-fehbg "$HOME/.local/wallpapers/$(ls /home/kacper/.local/wallpapers/ | sort -R | tail -1)"
slstatus &
udiskie &
dunst &
otd &
exec dwm
