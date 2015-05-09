#!/bin/bash

# Script simple que ejecuta tres músicas infinitamente, el objetivo de las
# mismas es que sean adecuadas para el estudio.

# Bajar los .mp3 de:
#   http://endlessvideo.com/watch?v=DIx3aMRDUL4
#   http://endlessvideo.com/watch?v=HMnrl0tmd3k
#   http://www.rainymood.com

mplayer ~/Music/jazz.mp3      -loop 0 -volume 50 < /dev/null >/dev/null 2>&1 &
mplayer ~/Music/fireplace.mp3 -loop 0 < /dev/null >/dev/null 2>&1 &
mplayer ~/Music/rain.m4a      -loop 0 < /dev/null >/dev/null 2>&1 &

