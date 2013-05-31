function fish_prompt
  echo -n [
  set_color white
  echo -n $USER
  set_color normal
  echo -n @
  set_color white
  hostname | tr -d "\n"
  echo -n ' '(prompt_pwd)
  set_color normal
  echo -n ']$ '
end

function fish_right_prompt
    set cmd_status $status
	echo -n [
	set_color white
	echo -n $cmd_status
	set_color normal
	echo -n ]
end

