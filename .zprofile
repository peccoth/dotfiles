export PATH=/home/kacper/.local/bin:$PATH
export PATH=/home/kacper/.cargo/bin:$PATH
export PATH=/home/kacper/.gem/ruby/2.7.0/bin:$PATH
export EDITOR=nvim
export VISUAL=nvim
export XDG_MUSIC_DIR="/home/kacper/Music/"
export XDG_DATA_HOME="/home/kacper/.local/share/applications/"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
