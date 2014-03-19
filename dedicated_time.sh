#!/bin/bash
export DISPLAY=:0

FORMAT="-i id -t tiempo -c descripcion"
COMMAND="kdialog --title \"Tiempo dedicado\" --inputbox \"Formato: $FORMAT\" \"$FORMAT\""
while [ -z "$COMMENT" ]; do
   ISSUE=`kdialog --title "Peticion actual" --inputbox "ID de la petición actual " "0000"`
   TIEMPO=`kdialog --title "Tiempo Total" --inputbox "Ingrese el tiempo" "2"`
   COMMENT=`kdialog --title "Comentario" --inputbox "Descripción del trabajo realizaro" "Impactación de parche"`
done

if [ -z "$ISSUE" ]; do
    python /home/avolpe/programs/grtk/spent.py -i $ISSUE -t $TIEMPO -c "$COMMENT"
done
