#!/bin/bash

pidOfPicom=$(pidof picom)

if [[ -z "$pidOfPicom" ]]; then
    picom -b --experimental-backends --backend glx
else
    kill $pidOfPicom
fi
