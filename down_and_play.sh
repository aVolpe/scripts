#!/bin/bash

# Script que descarga y ejecuta una musica automaticamente

# Requisitos:

# youtube-dl: para descargar videos
# mplayer: para ejecutar la musica

function usage () {
    echo "./down_and_play \"my super query\""
    exit
}

if [[ $1 == "" ]]
then
    usage
fi

echo "Searching... '$1'"
rm mp3.mp3
youtube-dl --extract-audio --audio-format mp3 "gvsearch1:$1" --output mp3.mp3
ffplay mp3.mp3 -autoexit

