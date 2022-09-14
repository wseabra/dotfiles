#!/bin/bash

#adapted from: https://github.com/getmicah/spotify-now
status=`pidof spotify | wc -l`
if [[ "$status" != 1 ]]; then
    exit 1
fi

PLAYBACK=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' | grep -o Paused`
if [[ "$PLAYBACK" == "Paused" ]]; then
    echo '⏸ Song paused'
    exit 1
fi

META=`dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'`

ARTIST=$(echo "$META" | grep -m 1 "xesam:artist" -b2 | tail -n1)
ARTIST="${ARTIST%\"*}"
ARTIST="${ARTIST#*\"}"

TITLE=$(echo "$META" | grep -m 1 "xesam:title" -b1 | tail -n1)
TITLE="${TITLE%\"*}"
TITLE="${TITLE#*\"}"

echo "♫ $ARTIST - $TITLE"

