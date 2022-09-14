#!/bin/bash

WM_DESKTOP=$(xdotool getwindowfocus)

if [ $WM_DESKTOP == "2097153" ]; then

    echo ""

elif [ $WM_DESKTOP != "1883" ]; then

    WM_CLASS=$(xprop -id $(xdotool getactivewindow) WM_CLASS | awk 'NF {print $NF}' | sed 's/"/ /g')
    WM_NAME=$(xprop -id $(xdotool getactivewindow) WM_NAME | cut -d '=' -f 2 | awk -F\" '{ print $2 }')

    if [ "$WM_CLASS" == 'Enter WM_CLASS value here' ]; then

        echo "%{F#ffffff}Custom name%{u-}"

    elif [ "$WM_NAME" == 'Enter WM_NAME value here' ]; then

        echo "%{F#ffffff}Custom name%{u-}"

    else

        echo "%{F#ffffff}$WM_CLASS%{u-}"

    fi

fi
