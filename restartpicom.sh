#!/bin/bash

pidOfPicom=$(pidof picom)

if [[ -z "$pidOfPicom" ]]; then
    picom -b
else
    kill $pidOfPicom
fi
