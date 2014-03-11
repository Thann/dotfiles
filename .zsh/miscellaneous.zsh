# Ignore comments when parsing command line
setopt interactivecomments

# Function to easily set the terminal title
function st {
	if ! [[ $(tty) =~ tty ]]; then # Don't do this on a real tty.
		echo -n "\033]2;${@}\007";
	fi
}

# Set term title to current folder name
function stt {
	st "$(basename "$(pwd)")" $@
}

# Title new graphical shell instances.
stt 2> /dev/null

