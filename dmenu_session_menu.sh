#!/bin/bash
#
# a simple dmenu session script 
#
###

hc() {
    herbstclient "$@"
}
ScreenLocker=physlock

DMENU='dmenu -i  -sb #345F0C'
choice=$(echo -e "logout\nshutdown\nreboot\nsuspend\nlock" | $DMENU)

case "$choice" in
  logout) hc quit & ;;
  shutdown) systemctl poweroff ;;
  reboot) systemctl reboot ;;
  suspend) systemctl suspend --quiet
      $ScreenLocker
     setxkbmap -layout "us,br" -variant "intl," ;;
  lock) $ScreenLocker;;
esac
