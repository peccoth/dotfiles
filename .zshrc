bindkey -v
autoload -Uz compinit promptinit
compinit && promptinit

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
prompt_theme_setup() {
    PS1="%F{2}%~%f %# "
}
prompt_themes+=( theme )
prompt theme

zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
# aliases
alias vim=nvim
alias vi=nvim
alias v=nvim
alias dotfiles='git --git-dir=$HOME/.local/dotfiles --work-tree=$HOME'
