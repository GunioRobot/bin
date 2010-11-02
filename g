#!/bin/bash

unset GREP_OPTIONS

pattern=$1

shift

if [ $# == 1 ]; then
files="$@"
else
files=.
fi

grep -ERHn \
     --exclude=".*.swp" \
     --exclude="*.log" \
     --exclude=".svn/*" \
     --exclude="*.tmp" \
     --exclude="*.svn-base" \
     --exclude=".git/*" \
     --color=always \
     --binary-files=without-match \
     "$pattern" \
     $files \
     2>/dev/null
