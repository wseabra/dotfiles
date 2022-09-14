#!/bin/bash

BATF(){
AWKBAT='
	{
	    gsub(/,|%/,"")
	    if ($3 == "Charging") {
		print "" " " $4"%"
	    } else if ($4 <= 15) {
		print "" " " $4"%"
	    } else if ($4 <= 25) {
		print "" " " $4"%"
	    } else if ($4 <= 50) {
		print "" " " $4"%"
	    } else if ($4 <= 75) {
		print "" " " $4"%"
	    } else {
		print "" " " $4"%"
	    }
	}'

	BAT=$(acpi | awk "$AWKBAT")

	if [[ -n $BAT ]]; then
		echo $BAT
	else
		echo ?
	fi
}
