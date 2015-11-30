#!/bin/bash

cd ~

day=`date +%a`
hour=`date +%H`

rm ~/.last_login

function home() {
    echo "Home";
    sh ~/.scripts/home.sh > ~/.last_login;
}

function place1() {
    echo "Facultad";
    sh ~/.scripts/facu.sh > ~/.last_login;
}

function not_weekend () {
    case $hour in
        (0[7-9]|1[0-5])
            place1;;
        *)
            home;;
    esac
}

home

xrandr --output VGA-1-2 --off
xrandr --output VGA-1-1 --off

nohup /opt/custom/programs/keynav/keynav &
rm /tmp/relax_*
echo "Montando datos"
sudo mount /dev/sdb1 /home/avolpe/datos
