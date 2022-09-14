#!/bin/bash
MonitorCount=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l) 
OfficeSetupScript=$HOME/.screenlayout/officeLayout.sh
VirtualMonitorCount=$(herbstclient list_monitors | wc -l)
if [ $MonitorCount -eq 3 ]; then
    "$OfficeSetupScript" &
    if [ $VirtualMonitorCount -eq 4 ]; then
        notify-send --icon=gtk-info Monitors "3 monitors found\nChanging to office setup"
        herbstclient set_monitors 1920x1080+0+560 2560x1080+1920+560 1080x1920+4480+0
    else
        notify-send --icon=gtk-info Monitors "3 monitors found\nChanging to office setup (1 Virtual Monitor)"
        herbstclient set_monitors 1920x1080+0+560 2100x1080+1920+560 460x1080+4020+560 1080x1920+4480+0
    fi
else
# or simply:
    hc detect_monitors
fi
