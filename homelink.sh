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
DEBUG=false # List all links that would be made regardless of pre-existence
# END: User-Config-Vars.

DRY_RUN=false # Dont make any links
if [ "$1" == "--help" ] ; then echo $USAGE; exit; fi
if [ "$1" == "-d" ] ; then DRY_RUN=true; echo "DRY RUN!"; fi

cd $SOURCE
IFS=$'\n'
if $DEBUG ; then echo "==DEBUG=="; DRY_RUN=true; fi
if $DRY_RUN ; then PRE_RUN="echo"; else PRE_RUN=""; fi
if $LINK_DIRS ; then FIND_ARGS="-maxdepth 0"; else FIND_ARGS=""; fi

# Loop through the base files
for p in $(IFS=" "; find ./ -maxdepth 1) ; do
	p=$(echo $p | cut -c 3-)
	if [ "`echo $p | cut -b -4 `" == ".git" ] ; then continue; fi # ignore the files & folders in that start with '.git'
	if [ "`echo $p | cut -b -1 `" != "." ] ; then continue; fi # ignore the files & folders that don't start with a dot

	# loop through all files with prefix $p
	for f in $(IFS=" "; find ./$p $FIND_ARGS) ; do
		f=$(echo $f | cut -c 3-)
		TT="$TARGET/$f"
		if ! $DEBUG && [ -e $TT ] ; then continue; fi # ignore if the target already exists...
		if [ "`echo $f | tail -c 5 `" == ".swp" ] ; then continue; fi # ignore vim swp files

		if ! $LINK_DIRS && [ -d $f ] ; then
			$PRE_RUN mkdir -p $TT;
		else
			$PRE_RUN ln -s -t $(dirname $TT)  $(pwd)/$f; # dirname cuts off the trailing quote =/
		fi
	done
done
