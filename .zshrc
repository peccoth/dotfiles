bindkey -v
autoload -U compinit promptinit
compinit && promptinit

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
prompt_theme_setup() {
    PS1="%F{2}%~%f %# "
}
prompt_themes+=( theme )
prompt theme
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
setopt autocd 
# aliases
alias ls='ls --color'
alias vim=nvim
alias vi=nvim
alias v=nvim
alias dotfiles='git --git-dir=$HOME/.local/dotfiles.git --work-tree=$HOME'
alias feh='feh -.'
alias top=htop
