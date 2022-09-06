export ZDOTDIR="$HOME/.config/zsh"
export PATH=/home/kacper/.local/bin:$PATH
export PATH=/home/kacper/.cargo/bin:$PATH
export PATH=/home/kacper/.gem/ruby/2.7.0/bin:$PATH
export EDITOR=nvim
export VISUAL=nvim
export XDG_MUSIC_DIR="/home/kacper/Music/"
export XDG_DATA_HOME="/home/kacper/.local/share/applications/"
export XSECURELOCK_SAVER=saver_xscreensaver

export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export SDL_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx &> /dev/null
fi
