alias ls='ls --color=auto'
alias la='ls -lha'
alias lt='ls -t'
alias ll=la

alias df="df -h"

alias cd='HOME="" cd'

alias vi='vim'
alias gi='gvim'
alias sb='subl'
alias at='atom'
alias vim='nvim'

alias sx=startx
alias systemctl='sudo systemctl'

# git: default to status
git() { command git ${1-status} ${@[@]:2} }
alias g='git'
alias gs='git status'

alias be='bundle exec'

alias ch='chromium'
alias dk='docker'
alias dkc='docker-compose'
docker_logs_less() { docker logs $1 -f --tail ${2-0} 2>&1 | less; }
docker_restart_logs_less() { docker restart $1 && docker_logs_less $@; }
alias dkl='docker_logs_less'
alias dkrl='docker_restart_logs_less'
# autocomplete
. /usr/share/zsh/site-functions/_docker
_docker_logs_less() {
    integer ret=1
    words[1]='logs'
    __docker_subcommand && ret=0
    return ret
}
compdef _docker_logs_less docker_logs_less docker_restart_logs_less

alias temp='watch -n 5 -c -d sensors'

alias pp="ping -c 1 8.8.8.8 | \grep --color=always time=.\*$"

# todo.sh shortcuts
alias t='noglob todo.sh'
alias tl='t ls'
alias tt='t top'
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

alias -g LL='|less'

# Json Pretty Print
alias -g JPP='|python -mjson.tool'
alias -g JPL='|python -mjson.tool |less'

# ASCII image viewer
alias caca="CACA_DRIVER=ncurses cacaview"
alias mpc="mpv --really-quiet --image-display-duration=inf --vo=tct"

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
grepl() { grep --color=always $@ | less -p'^' }
alias gl=grepl
alias gr="grep -r"
alias glr="grepl -r"
alias todo="grepl -r \"\(#\|//\) \?TODO\""

record() {
  ffmpeg -f alsa -i pulse -f x11grab -r 25 -s 1920x1080 -i :0.0 -acodec pcm_s16le -vcodec huffyuv ${1-Screencast}.avi
}

# Colorized man pages
man() {
		# bold=cyan
		# underline=green
		# standout=green / black
    env \
        LESS_TERMCAP_md=$'\e[1;36m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[1;32m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[1;40;92m' \
        LESS_TERMCAP_se=$'\e[0m' \
            man "$@"
}
lolman() { command man ${@} | lolcat --force | less }
#alias man=lolman

rand() { dd if=/dev/urandom bs="${1-256}" count=1 2>/dev/null | base64 }

# extract and write
zdd() {
  lsblk "$2"
  unzip -l "$1"
  numfmt --to=iec-i --suffix=B --format="%.3f" $(unzip  -l "$1"  | tail -n1 | awk '{print $1}')
  unzip -p "$1" | sudo dd "of=$2" bs=64k oflag=dsync status=progress
}
