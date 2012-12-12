## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt inc_append_history
setopt share_history # share command history data
