# Function to easily set the terminal title
function st {
	echo -n "\033]2;${1}\007"
}
