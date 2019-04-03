#!/bin/bash

BAT=$(acpi | awk 'NR==1{print $3" "$4}' | sed 's/,//g')

if [[ -n $BAT ]]; then
    echo $BAT
else
    echo ?
fi

