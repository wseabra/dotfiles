#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# run program [some arguments]
run redshift-gtk
run picom
run nm-applet
run xfce4-power-manager
run volumeicon
run blueman-applet
run nitrogen --restore
run insync start
run dropbox start
run light-locker --lock-on-suspend
run caffeine
