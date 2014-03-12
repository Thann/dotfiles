ZSH=$HOME/.zsh

# load zsh configurations
for config_file ($ZSH/*.zsh) source $config_file

ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'

PROMPT="[%{$fg[white]%}%n%{$reset_color%}@%{$fg[white]%}%m %{$fg[white]%}%1~%{$reset_color%}% ]%(#,#,$) "
RPROMPT='$(git_super_status)[%{$fg[white]%}%?%{$reset_color%}]'

# enable tab completion
autoload -U compinit
compinit -i

