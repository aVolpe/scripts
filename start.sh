#!/bin/bash

#sleep 5
#conky -c ~/.conky/V2/conkyrc &

cd ~

day=`date +%a`
hour=`date +%H`
#echo $day
#echo $hour

rm ~/.last_login

function home() {
    echo "Home";
    sh ~/scripts/home.sh > ~/.last_login;
}

function place1() {
    echo "Facultad";
    sh ~/scripts/facu.sh > ~/.last_login;
}

function not_weekend () {
    case $hour in
        (0[7-9]|1[0-5])
            place1;;
        *)
            home;;
    esac
}

#case $day in
    #S*)
        #home;;
    #*)
        #not_weekend;;
#esac

home
#sleep 3
#feh --bg-scale /usr/share/wallpapers/openSUSEdefault/contents/images/1920x1080.jpg
xrandr --output VGA-1-2 --off
xrandr --output VGA-1-1 --off

rm /tmp/relax_*
