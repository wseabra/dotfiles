#/bin/bash

IP="$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')"
if [[ $IP ]]; then
    echo $IP
else
    echo "not connected"
fi
