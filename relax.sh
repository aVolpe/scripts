#!/bin/bash

# Script que ejecuta música de fondo

# Parámetros
# download: Descarga la música y la aloja en ~/Music/
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

    mplayer ~/Music/jazz.mp3      -slave -input file="$PIPE_JAZZ" -loop 0 -volume 50  < /dev/null >/dev/null 2>&1 &
    mplayer ~/Music/fireplace.mp3 -slave -input file="$PIPE_FIRE" -loop 0             < /dev/null >/dev/null 2>&1 &
    mplayer ~/Music/rain.mp4a     -slave -input file="$PIPE_RAIN" -loop 0             < /dev/null >/dev/null 2>&1 &

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

opt="$1"
case "$opt" in
    "")
        usage;;
    "start")
        start;;
    "stop")
        stop;;
    "pause")
        pause;;
esac


