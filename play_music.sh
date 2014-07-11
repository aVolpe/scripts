#!/bin/bash
# Script que se encarga de iniciar una musica a través de cmus

proc=$(pgrep cmus)
echo $proc
if [[ -z $proc ]]; then
    echo "Starting cmus"
    # start cmub
    yakuake-session -t 'CMUS' -q -e cmus &
    #wait for cmus to start
    sleep 1
else
    echo "Cmus Already started"
fi

cmus-remote -u

