#!/bin/bash

# Script para configuracion automatica de monitores
# xrandr -q 			| para ver una lista de todos las opciones posibles
# cvt 1920 1080 		# para agregar una nueva resolucion
# xrandr --newmode "1920x1080" 173.00  1920 2048 2248 2576  1080 1083 1088 1120 -HSync +VSync
# xrandr --addmode VGA1 "1920x1080"
# Para mas detalles vease: http://forums.opensuse.org/english/get-technical-help-here/hardware/458654-xrandr-does-not-detect-external-monitor-native-resolution.html


# Parámetros
# $1 = SINGLE o DUAL (por defecto DUAL)
# $2 = Nombre de la VGA (por defecto VGA1)
# $3 = Resolucion de la VGA $2, por defecto 1920x1080
# $4 = Si se pasa IZQ, $2 estará a la izquierda, DER a la derecha, por defecto es IZQ

# Recursos
# Manipulacion de cadenas http://tldp.org/LDP/abs/html/string-manipulation.html

DUAL="dual"
SINGLE="single"
POS=$4
VGA=$2
RES=$3
if [[ $3 == "" ]]
then
  RES="1920x1080"
fi
if [[ $2 == "" ]] 
then
  VGA="VGA1"
fi
if [[ $4 == "" ]]
then 
  POS="IZQ"
fi

#Configuracion del la posicion
echo "$RES"
X=${RES%x*}
Y=${RES#*x}
echo "Configurando para" $1
echo $VGA

#Proceso de invertir utilizando el OFFSET, siempre el monitor quye se conecta es el principal
offset="1366x0"
if [[ "$POS" == "IZQ" ]]
then
	echo Offset es $X
	offset="-${X}x0"
fi


if [[ $1 != $SINGLE ]] 
then
	xrandr --output LVDS1 --mode 1366x768 --pos 0x0 --auto --output $VGA --mode $RES --pos "$offset" --primary --auto
else
	xrandr --output LVDS1 --mode 1366x768 --auto --primary
fi
