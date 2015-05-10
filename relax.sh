#!/bin/bash

# Script que ejecuta música de fondo, utilizando mplayer.

# Para descargar la música es requerido:
# * youtube-dl
# * wget

# Parámetros
# download: 
#   Descarga la música y la aloja en ~/Music/
# pause: 
#   Si no se esta ejecutando: lo ejecuta
#   Si se ejecuta lo pausa
#   Si esta pausado lo reanuda
# stop:
#   Para la ejecución
# start:
#   Inicia la música


PIPE_JAZZ="/tmp/relax_jazz"
PIPE_FIRE="/tmp/relax_fireplace"
PIPE_RAIN="/tmp/relax_rain"

MUSIC_HOME=~/Music

function is_running () {
    if [ -p "$PIPE_JAZZ" ]; then
        return 0
    fi
    return 1
}

function create_pipe () {
    if [ ! -p "$1"  ]; then
        mkfifo "$1"
        echo "Creating pipe"
    else
        echo "Pipe already created $1"
    fi
}


function to_pipe() {

    echo "Broadcasting $1"

    echo "$1" > "$PIPE_JAZZ"
    echo "$1" > "$PIPE_FIRE"
    echo "$1" > "$PIPE_RAIN"
}

function start() {

    if is_running; then
        echo "Already running"
        exit
    fi

    create_pipe "$PIPE_JAZZ"
    create_pipe "$PIPE_FIRE"
    create_pipe "$PIPE_RAIN"

    mplayer "$MUSIC_HOME/jazz.mp3"      -slave -input file="$PIPE_JAZZ" -loop 0 -volume 50  < /dev/null >/dev/null 2>&1 &
    mplayer "$MUSIC_HOME/fireplace.mp3" -slave -input file="$PIPE_FIRE" -loop 0             < /dev/null >/dev/null 2>&1 &
    mplayer "$MUSIC_HOME/rain.m4a"      -slave -input file="$PIPE_RAIN" -loop 0             < /dev/null >/dev/null 2>&1 &

}

function stop() {
    if [ ! is_running ]; then
        echo "Not running"
        exit
    fi
 
    to_pipe "quit"
    rm "$PIPE_JAZZ"
    rm "$PIPE_FIRE"
    rm "$PIPE_RAIN"
}

function pause() {
 
    if is_running; then
        to_pipe "pause"
    else
        start
    fi
}

function usage() {
    echo "Usage sh relax.sh start|stop|pause"
 
}

function download() {
 
    echo "Downloading rain"
    wget -O "$MUSIC_HOME/rain.m4a" "http://174.36.223.28/audio1110/0.m4a"
    echo "Downloading fireplace"
    youtube-dl  --audio-quality 0 -x --audio-format mp3 "https://www.youtube.com/watch?v=DIx3aMRDUL4" -o "$MUSIC_HOME/fireplace.mp3"
    echo "Downloading jazz"
    youtube-dl  --audio-quality 0 -x --audio-format mp3 "https://www.youtube.com/watch?v=HMnrl0tmd3k" -o "$MUSIC_HOME/jazz.mp3"
    echo "Download complete, run sh relax.sh start"
}

opt="$1"
case "$opt" in
    "start")
        start;;
    "stop")
        stop;;
    "pause")
        pause;;
    "download")
        download;;
    *)
        usage;;
esac


