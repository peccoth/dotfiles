HISTFILE=~/.config/zsh/zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
bindkey -v
autoload -U compinit promptinit
compinit && promptinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
prompt_theme_setup() {
    PS1="%F{4}[%m]%f %F{2}%~%f %# "
}
prompt_themes+=( theme )
prompt theme
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

