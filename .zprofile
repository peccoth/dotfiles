export BROWSER=brave
export EDITOR=nvim
export GTK_IM_MODULE=fcitx
export GTK_USE_PORTAL=1
export NIXPKGS_ALLOW_UNFREE=1
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export QT_IM_MODULE=fcitx
export QT_XCB_GL_INTEGRATION=none
export SDL_IM_MODULE=fcitx
export TERMINAL=foot
export VISUAL=nvim
export XDG_DATA_HOME=$HOME/.local/share/
export XDG_MUSIC_DIR=$HOME/Music/
export XMODIFIERS="@im=fcitx"
export ZDOTDIR=$HOME/.config/zsh

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec river
fi
