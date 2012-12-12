# ls colors
autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"

setopt auto_cd
setopt multios
setopt cdablevarS

# Apply theming defaults
PS1="%n@%m:%~%# "

# Setup the prompt with pretty colors
setopt prompt_subst
