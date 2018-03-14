ZSH=$HOME/.zsh

# enable tab completion
autoload -U compinit
compinit -i

# load zsh configurations
for config_file ($ZSH/*.zsh) source $config_file

ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'

_RTAB='$(rtab -l -t 2> /dev/null || basename `pwd`)'
PROMPT="[%{$fg[white]%}%n%{$reset_color%}@%{$fg[white]%}%m %{$fg[white]%}${_RTAB}%{$reset_color%}% ]%(#,#,$) "
RPROMPT='$(git_super_status)[%{$fg[white]%}%?%(1j.%{$fg[cyan]%}&%j.)%{$reset_color%}]'

# init nvm
if [ -e /usr/share/nvm/init-nvm.sh ]; then
	source /usr/share/nvm/init-nvm.sh
fi
export PATH="./node_modules/.bin:$HOME/.npm/bin:$PATH"

# add user-installed ruby bins to path.
#export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

