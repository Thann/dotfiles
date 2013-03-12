# Ignore comments when parsing command line
setopt interactivecomments

# Function to easily set the terminal title
function st {
	echo -n "\033]2;${@}\007"
}

# Set term title to current folder name
function stt {
	st "$(basename "$(pwd)")" $@
}
