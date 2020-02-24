#!/bin/bash
AMIXEROUT=$(amixer get Master | grep -m 1 "[0-9]*%")

VOL=$(echo $AMIXEROUT | grep -o -m 1 "[0-9]*%"| tr -d "%")

STATUS=$(echo $AMIXEROUT | grep -o -m 1 "off")

if [ $VOL -eq 0 ] || [ -n "$STATUS" ]; then
    #muted
    echo muted $VOL%
elif [[ $VOL -le 33 ]]; then
    #statements
    echo  $VOL%
elif [[ $VOL -le 66 ]]; then
    #statements
    echo  $VOL%
elif [[ $VOL -le 100 ]]; then
    #statements
    echo  $VOL%
fi
