#!/bin/sh

trap ctrl_c INT

function ctrl_c() {
    echo ""
    echo "Final time: $last_time"
    exit
}
notified=""
last_time=0
date1=`date +%s`;
while true; do 
    last_time="$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)"
    echo -ne "$last_time\r";
    sleep 0.1
    if [ "$1" == "$last_time" ]; then
        if [ "$notified" == "" ]; then
            python ~/scripts/notify.py Check Check;
            echo ""
            notified="a"
        fi
    fi
done
