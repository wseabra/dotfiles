#!/bin/bash

perfil=`pactl list | grep "Perfil ativo" | grep "headset-head-unit-msbc"`
if [[ -n "$perfil" ]]; then
    echo "HSP/HFP"
fi
perfil=`pactl list | grep "Perfil ativo" | grep "a2dp-sink-sbc"`
if [[ -n "$perfil" ]]; then
    echo "A2DP"
fi
