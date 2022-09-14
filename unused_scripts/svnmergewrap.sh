#!/bin/sh
#


BASE=${1}
THEIRS=${2}
MINE=${3}
MERGED=${4}
WCPATH=${5}

/usr/local/bin/vimdiff $MINE $THEIRS -c ":botright split $MERGED" -c ":diffthis" -c "setl statusline=MERGED | wincmd W | setl statusline=THEIRS | wincmd W | setl statusline=MINE"