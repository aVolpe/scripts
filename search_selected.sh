#!bin/bash

# Open or show google chrome
sh toggle.sh 'Google Chrome' 'google-chrome'
#Search the text coppied in the clipboard
xdotool search "Google Chrome" windowactivate --sync key --clearmodifiers ctrl+t ctrl+l ctrl+v Return
