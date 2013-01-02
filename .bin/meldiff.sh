#!/bin/sh
# This trims down the git diff arguments so as to work with meld.
# Use the following command to setup git to use this script.
# git config --global diff.external ~/.bin/meldiff.sh

meld $2 $5
