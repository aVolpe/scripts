#!/bin/bash

# Script que descarga y ejecuta una musica automaticamente

# Requisitos:

# youtube-dl: para descargar videos
# mplayer: para ejecutar la musica

function usage () {
    echo "./down_and_play \"my super query\""
    exit
}

function play() {
    mplayer "$(youtube-dl -g $1)"
}

if [[ $1 == "" ]]
then
    usage
fi

echo "Searching... '$1'"
URL=`youtube-dl -g "gvsearch1:$1"`

echo "Playing $URL"

play $URL
