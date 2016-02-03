## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

#setopt append_history
#setopt inc_append_history
setopt share_history # share command history data

setopt hist_ignore_all_dups
setopt hist_ignore_space
