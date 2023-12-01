HISTFILE=~/.config/zsh/zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
bindkey -v
autoload -U compinit promptinit
compinit && promptinit
autoload -Uz vcs_info
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}
setopt prompt_subst

prompt_theme_setup() {
    PS1="${vcs_info_msg_0_}%F{4}[%m]%f %F{2}%~%f %# "
}

#killall(name) {
#  kill -9 $(ps -e | grep -i name | cut -f 3 -d " " )
#}


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
alias clocks='watch -n.1 "grep \"^[c]pu MHz\" /proc/cpuinfo"'
