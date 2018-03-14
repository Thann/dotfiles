# Ignore comments when parsing command line
setopt interactivecomments

# Function to easily set the terminal title
st() {
	if ! [[ $(tty) =~ tty ]]; then # Don't do this on a real tty.
    if [ -z "$1" ]; then
      # Set term title to current folder name
      echo -n "\033]2;$(basename $(pwd))\007";
    else
      echo -n "\033]2;$@\007";
    fi
	fi
}

alias stt=st

# Title new graphical shell instances.
st 2> /dev/null

