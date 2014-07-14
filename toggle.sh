#!/bin/zsh

# Starts or show a program

if [ -z "$1" ] || [ -z "$2" ] ; then
	echo "Usage: sh toggle.sh 'Window Title' 'Path to program'"
fi

wid=`xdotool search --name "$1"`

if test "$wid" = "" ; then
    `"$2"` &
    exit
fi

current=`xdotool getactivewindow`
for id in $wid
do
	if test $id = $current ; then
		xdotool windowminimize "$id"
	else
		xdotool windowactivate "$id"
	fi
done
