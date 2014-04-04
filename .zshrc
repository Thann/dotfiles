ZSH=$HOME/.zsh

# load zsh configurations
for config_file ($ZSH/*.zsh) source $config_file

ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'

_RTAB='$(rtab -l -t 2> /dev/null || basename `pwd`)'
PROMPT="[%{$fg[white]%}%n%{$reset_color%}@%{$fg[white]%}%m %{$fg[white]%}${_RTAB}%{$reset_color%}% ]%(#,#,$) "
RPROMPT='$(git_super_status)[%{$fg[white]%}%?%{$reset_color%}]'

# enable tab completion
autoload -U compinit
compinit -i

