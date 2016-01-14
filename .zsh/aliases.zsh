alias ls='ls --color=auto'
alias la='ls -lha'
alias lt='ls -t'
alias ll=la

alias cd='HOME="" cd'

alias vi='vim'
alias gi='gvim'
alias sb='subl3'

alias systemctl='sudo systemctl'

alias gs='git status'

alias be='bundle exec'

alias ch='chromium'

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

# Json Pretty Print
alias -g JPP='|python -mjson.tool'

# ASCII image viewer
alias caca="CACA_DRIVER=ncurses cacaview"

# noglob
alias bundle="noglob bundle"
alias grep="noglob grep -n --color=auto"

alias ff='jobs'
alias f1='builtin fg %1'
alias f2='builtin fg %2'
alias f3='builtin fg %3'

alias smile='echo "   ¯\_(ツ)_/¯   ಠ_ಠ   ˚▱˚   ^̮^   ◔̯◔   ◕‿◕   (^▽^)   "'

fg() { builtin fg %$@ }

# Grep the list of functions and commands.
lsf() {
	autoload bashcompinit
	bashcompinit
	compgen -A function -abck | \grep --color=auto $@
}

# Pipe grep into less.. with color!
grepl() { grep --color=always $@ | less }

