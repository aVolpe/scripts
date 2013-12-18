#!/bin/bash

#sleep 5
#conky -c /home/arturo/.conky/V2/conkyrc &

day=`date +%a`
hour=`date +%H`
#echo $day
#echo $hour

rm ~/.last_login

function home() {
    echo "Home";
    sh /home/arturo/scripts/home.sh > ~/.last_login;
}

function place1() {
    echo "Facultad";
    sh /home/arturo/scripts/facu.sh > ~/.last_login;
}

function not_weekend () {
    case $hour in
        (0[7-9]|1[0-3])
            place1;;
        *)
            home;;
    esac
}

case $day in
    S*)
        home;;
    *)
        not_weekend;;
esac

#sleep 3
#feh --bg-scale /usr/share/wallpapers/openSUSEdefault/contents/images/1920x1080.jpg

