#!/bin/bash

pidOfPicom=$(pidof picom)

if [[ -z "$pidOfPicom" ]]; then
    picom &
else
    kill $pidOfPicom
fi
