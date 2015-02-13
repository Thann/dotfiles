alias ls='ls --color=auto'
alias la='ls -lha --color=auto'
alias ll=la

alias cd='HOME="" cd'

alias vi='vim'
alias gi='gvim'
alias sb='subl3'

alias systemctl='sudo systemctl'

alias gs='git status'

alias be='bundle exec'

# todo.sh shortcuts
alias t='noglob todo.sh'
alias tl='t ls'
alias ta='t add'
alias taa='t add (A)'
alias te='t edit'
alias tly='t lately'
alias tvc='t view context'
alias tvp='t view project'

# Total: `grep -rc thing TT`
alias -g TT="| awk -F: '{ s+=\$2 } END { print s }' "

# Count: `grep -rl thing CC`
alias -g CC="| wc -l "

#Json Pretty Print
alias -g JPP='|python -mjson.tool'

#noglob
alias bundle="noglob bundle"
alias grep="noglob grep -n --color=auto"

alias ff='jobs'
alias f1='builtin fg %1'
alias f2='builtin fg %2'
alias f3='builtin fg %3'
fg() { builtin fg %$@ }

#Git set upstream to origin/<branch>
gsu() {
	GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git branch --set-upstream-to=${1:-origin}/$GIT_BRANCH $GIT_BRANCH
}
