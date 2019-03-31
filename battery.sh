#!/bin/bash

BAT=$(acpi | awk '{print $3" "$4}' | sed 's/,//g')

if [[ $BAT ]]; then
    echo $BAT
else
    echo ?
fi

