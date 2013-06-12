alias ls='ls --color=auto'
alias la='ls -lha --color=auto'
alias ll=la

alias cd='HOME="" cd'

alias vi='vim'
alias gi='gvim'

alias systemctl='sudo systemctl'

alias gs='git status'

# todo.sh shortcuts
alias t='todo.sh'
alias tl='t ls'
alias ta='t add'
alias te='t edit'
alias tly='t lately'
alias tvc='t view context'
alias tvp='t view project'

# Total: `grep -rc thing TT`
alias -g TT="| awk -F: '{ s+=\$2 } END { print s }' "

# Count: `grep -rl thing CC`
alias -g CC="| wc -l "

