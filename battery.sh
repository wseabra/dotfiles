#!/bin/bash

BAT=$(acpi | awk -f bat.awk)

if [[ -n $BAT ]]; then
    echo $BAT
else
    echo ?
fi

