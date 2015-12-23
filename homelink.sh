#!/bin/sh
# Creates symlinks to all files in a directory.
#  --useful for linking dotfiles to an external repo

USAGE=$(cat <<HEREDOC
USAGE: `basename $0` [--help] [--dry-run] [--verbose] [--cleanup]
  --dry-run doesn't make any changes.
  --cleanup removes all previously-tracked files from the home directory.
  --verbose lists each file modified.
HEREDOC
);

TARGET=~
DRY_RUN=false
VERBOSE=false
CLEANUP=false

#EXPERIMENTAL: Make symlinks to dirs instead of `mkdir` then symlinking the contents.
LINK_DIRS=false

# Parse Args
for i in "$@"; do
	case $i in
		--help|-h)
			echo "$USAGE"; exit
			;;
		--dry-run|-d)
			DRY_RUN=true
			VERBOSE=true
			;;
		--verbose|-v)
			VERBOSE=true
			;;
		--cleanup|-c)
			CLEANUP=true
			;;
		*)
			echo "ERROR: unrecognised argument: $i"
			echo "$USAGE"; exit 1
			;;
	esac
done

# Setup
IFS=$'\n'
SOURCE=$(realpath $(dirname $0)) # Full path to dotfiles directory
cd $SOURCE > /dev/null
if $LINK_DIRS ; then FIND_ARGS="-maxdepth 0"; else FIND_ARGS=""; fi

# Make sure git submodules are up to date.
git submodule update --init #TODO: make this a command line arg.

if $DRY_RUN; then echo " == DRY RUN == "; fi

# Cleanup
if $CLEANUP; then
	echo "Cleaning up old/deleted files from home."

	# For every file ever deleted from this git repo...
	for f in $(git log --all --pretty=format: --name-only --diff-filter=D); do
		# If this repo DOESN'T contain the file...
		if ! [[ -e "$f" ]] ; then
			# If the file is a link to this repo...
			if [[ `readlink "$TARGET/$f"` == $SOURCE/* ]]; then
				echo "CLEANING: $TARGET/$f"
				if ! $DRY_RUN; then rm "$TARGET/$f"; fi
			fi
		fi
	done

	echo "Done!"
	exit
fi

# Loop through the base files
for p in $(IFS=" "; find ./ -maxdepth 1) ; do
	p=$(echo "$p" | cut -c 3-)
	if [ "$p" == ".git" ] || [ "$p" == ".gitmodules" ] || [ "$p" == ".gitignore" ]
		then continue; fi # ignore the files & folders belonging to git
	if [ "`echo "$p" | cut -b -1 `" != "." ] ; then continue; fi # ignore the files & folders that don't start with a dot

	# Loop through all files & folders with prefix $p
	for f in $(IFS=" "; find "./$p" $FIND_ARGS) ; do
		f=$(echo "$f" | cut -c 3-)
		TT="$TARGET/$f"
		if [ -e $TT ] ; then continue; fi # ignore if the target already exists...
		if [ "`echo $f | tail -c 5 `" == ".swp" ] ; then continue; fi # ignore vim swp files

		if ! $LINK_DIRS && [ -d "$f" ] && [ ! -L "$f" ] ; then
			if $VERBOSE; then echo "mkdir $f"; fi
			if $DRY_RUN; then continue; fi
			mkdir -p "$TT";
		else
			if $VERBOSE; then echo " ln   $f"; fi
			if $DRY_RUN; then continue; fi
			ln -s -t $(dirname $TT) "$SOURCE/$f"; # dirname cuts off the trailing quote =/
		fi
	done
done
