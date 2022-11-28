export ZDOTDIR=$HOME/.config/zsh
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
export EDITOR=nvim
export VISUAL=nvim
export XDG_MUSIC_DIR=$HOME/Music/
export XDG_DATA_HOME=$HOME/.local/share/applications/
export XSECURELOCK_SAVER=saver_xscreensaver

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx &> /dev/null
fi
