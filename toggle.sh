#!/bin/zsh

# Starts or show a program

if [ -z "$1" ] || [ -z "$2" ] ; then
	echo "Usage: sh toggle.sh 'Window Title' 'Path to program'"
fi

wid=`xdotool search --onlyvisible --name "$1"`
if test "$wid" = "" ; then
    exec "$2" &
    exit
fi

actual=`xdotool getactivewindow`
if test $wid = $actual ; then
	xdotool windowminimize $wid
else
	xdotool windowactivate $wid
fi
