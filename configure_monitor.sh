#!/bin/bash

# Script para configuracion automatica de monitores
# xrandr -q 			| para ver una lista de todos las opciones posibles
# cvt 1920 1080 		# para agregar una nueva resolucion
# xrandr --newmode "1920x1080" 173.00  1920 2048 2248 2576  1080 1083 1088 1120 -HSync +VSync
# xrandr --addmode VGA1 "1920x1080"
# Para mas detalles vease: http://forums.opensuse.org/english/get-technical-help-here/hardware/458654-xrandr-does-not-detect-external-monitor-native-resolution.html


# Parámetros
# $1 = SINGLE o DUAL (por defecto DUAL)
# $2 = Si se pasa IZQ, $2 estará a la izquierda, DER a la derecha, por defecto es IZQ
# $3 = Nombre de la VGA (por defecto VGA conectada)
# $4 = Resolucion de la VGA $2, por defecto máxima resolución del a VGA

# Recursos
# Manipulacion de cadenas http://tldp.org/LDP/abs/html/string-manipulation.html

echo "Usage: configure_monitor.sh SINGLE|DUAL VGAN RESXxRESy IZQ|DER"

DUAL="dual"
SINGLE="single"

PLACE=$1
POS=$2
VGA=$3
RES=$4

if [[ $1 == "" ]] 
then
  PLACE=$DUAL
fi

if [[ $2 == "" ]]
then 
  POS="IZQ"
fi

if [[ $3 == "" ]] 
then
  VGA=`xrandr | grep "VGA[0-9]" | cut -d " " -f1`
fi

if [[ $4 == "" ]]
then
  RES=`xrandr | grep "$VGA" -A 1 | tail -n 1 | tr -s " " | cut -d " " -f2`
fi


#Configuracion del la posicion

X=${RES%x*}
Y=${RES#*x}


#Proceso de invertir utilizando el OFFSET, siempre el monitor que se conecta es el principal
OFFSET="$Xx0"
if [[ "$POS" == "IZQ" ]]
then
	OFFSET="-${X}x0"
fi

echo
echo "#####################"
echo "Display: $VGA"
echo "Resolución: $RES"
echo "Tipo: " $PLACE
echo "Pos: $OFFSET"
echo "#####################"
echo



if [[ $PLACE != $SINGLE ]] 
then
	xrandr --output LVDS1 --mode 1366x768 --pos 0x0 --auto --output $VGA --mode $RES --pos "$OFFSET" --primary --auto
else
	xrandr --output LVDS1 --mode 1366x768 --auto --primary
fi
