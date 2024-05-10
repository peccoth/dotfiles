#!/bin/sh
userresources=$HOME/.config/X/Xresources
usermodmap=$HOME/.config/X/Xmodmap
xrandr --output DisplayPort-1 --mode 1920x1080 --rate 144 &
fcitx5 -d &
(sleep 5 && corectrl --minimize-systray) &

setxkbmap pl -variant colemak
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
nitrogen --restore
udiskie &
dunst &
joystickwake &
$(nix path-info --offline nixpkgs#polkit_gnome)/libexec/polkit-gnome-authentication-agent-1 &
otd-daemon &
if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
	eval $(dbus-launch --exit-with-session --sh-syntax)
fi
systemctl --user import-environment DISPLAY XAUTHORITY

if command -v dbus-update-activation-environment >/dev/null 2>&1; then
        dbus-update-activation-environment DISPLAY XAUTHORITY
fi
exec dwm
