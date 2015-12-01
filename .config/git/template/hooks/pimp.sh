#!/bin/sh
#
# Git hook multiplexer, allows multiple hooks of the same name.
# Just symlink the hook to this file, and name your scripts like so: blah.hook-name

hookname=$(basename $0)

FILE=`mktemp`
trap 'rm -f $FILE' EXIT
cat - > $FILE

for hook in $GIT_DIR/hooks/*.$hookname; do
  if test -x "$hook"; then

    cat $FILE | $hook "$@"
    status=$?

    if test $status -ne 0; then
      echo Hook $hook failed with error code $status
      exit $status
    fi
  fi
done
