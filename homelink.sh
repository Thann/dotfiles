#!/bin/sh
# Creates symlinks to all files in a directory.
#  --useful for linking dotfiles to an external repo

USAGE="USAGE: `basename $0` [-d | --help]"

# User-Config-Vars:
TARGET=~
SOURCE=$(dirname $0)

#TODO: make this a command line arg.
# set to `true` or `false` :
LINK_DIRS=false	# Make symlinks to dirs instead of `mkdir` then symlinking the contents.

# END: User-Config-Vars.
DRY_RUN=false # Dont make any links
if [ "$1" == "-d" ] ; then DRY_RUN=true; echo "DRY RUN!"; fi
if [ "$1" == "--help" ] ; then echo $USAGE; fi

cd $SOURCE
IFS=$'\n'
if $DRY_RUN ; then PRE_RUN="echo"; else PRE_RUN=""; fi
if $LINK_DIRS ; then FIND_ARGS="-maxdepth 1 "; else FIND_ARGS=""; fi

for f in $(IFS=" "; find ./ $FIND_ARGS) ; do
	f=$(echo $f | cut -c 3-)
	TT="$TARGET/$f"
	if [ -e $TT ] ; then continue; fi # ignore if the target already exists...
	if [ $f == $(basename $0) ] ; then continue; fi # ignore if the target is this script...
	if [ $f == "README.md" ] ; then continue; fi 
	if [ $f == ".git" ] ; then continue; fi # ignore the .git folder
	if [ $f == ".gitmodules" ] ; then continue; fi # ignore the .gitmodules file
	if [ "`echo $f | cut -b -5 `" == ".git/" ] ; then continue; fi # ignore the files & folders in .git folder
	if [ "`echo $f | cut -b -13 `" == ".detectindent/" ] ; then continue; fi # ignore the files & folders in .detectindent folder

	if ! $LINK_DIRS && [ -d $f ] ; then
		$PRE_RUN mkdir -p $TT;
	else
		$PRE_RUN ln -s -t $(dirname $TT)  $(pwd)/$f; # dirname cuts off the trailing quote =/
	fi
done
