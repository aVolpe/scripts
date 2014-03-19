#!/bin/bash
# arturovolpe@gmail.com basado en https://github.com/alefq/helper-scripts/blob/5186989ed7514d8dcb4f8e46fe66dea5314c7637/bin/Alarma.sh de afeltes@sodep.com.py
#
if [ $# -eq 2 ]; then
	echo "Running in background"
        sh $0 $1 "$2" BG &
else 
        if [ $# -eq 3 ] && [ $3 == 'BG' ]; then
                sleep $1m
                while [ 1 ]; do
                        RET=$(kdialog --radiolist "$2" 0 "Desactivar" 	off 	\
				  1 "1 minuto" 		on	\
				  5 "5 minutos" 	off	\
				  10 "10 minutos" 	off	\
				  15 "15 minutos"	off	\
				  60 "1 Hora"		off)
			if [[ $RET == "0" ]]
			then 
				echo "Terminando alarma $2"
				exit 0
			fi
			echo -e "Durmiendo $RET minutos"
			SLEEP=$RET"m"
			
			kdialog --title "$2" --passivepopup  "Sleep for $SLEEP" 10
			sleep $SLEEP
			
                done        
        else
                echo "uso: $0 #minutos MENSAJE"
        fi
fi
