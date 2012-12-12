ZSH=$HOME/.zsh

# load zsh specific stuff
for config_file ($ZSH/*.zsh) source $config_file

# load syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
. $ZSH/zsh-syntax-highlighting/*.zsh

ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'

# load legacy stuff
#for i in aliases bashrc2 commonrc functions zsh ; do [[ -f $HOME/.$i ]] && . $HOME/.$i ; done

PROMPT="[%{$fg[white]%}%n%{$reset_color%}@%{$fg[white]%}%m %{$fg[white]%}%1~%{$reset_color%}% ]$ "
#RPROMPT="[%{$fg[white]%}%?%{$reset_color%}]"
RPROMPT='$(git_super_status)[%{$fg[white]%}%?%{$reset_color%}]'

# enable tab completion
autoload -U compinit
compinit -i

