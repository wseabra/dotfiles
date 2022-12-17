#!/bin/bash

perfil=`pactl list | grep "Perfil ativo" | grep "headset-head-unit-msbc"`
card=`pactl list | grep "Nome: bluez_card." | cut -d ' ' -f 2`

if [ -n "$perfil" ]; then
    echo "Switching $card to a2dp..."
    pactl set-card-profile $card a2dp-sink-sbc
    echo "...done"
else
    echo "Switching $card to HSP/HFP..."
    pactl set-card-profile $card headset-head-unit-msbc
    echo "...done"
fi
