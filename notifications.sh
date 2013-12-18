#!bin/bash

TERERE='tere'

dbus_session_file=/home/arturo/.dbus/session-bus/$(cat /var/lib/dbus/machine-id)-0
if [ -e "$dbus_session_file" ]; then
  . "$dbus_session_file"
  export DBUS_SESSION_BUS_ADDRESS DBUS_SESSION_BUS_PID
fi

date=`date +%H:%M:%S`

if [[ $1 == $TERERE ]]
then
	python /home/arturo/scripts/notify.py 'Agua' "$date - Tomar agua"
else
	python /home/arturo/scripts/notify.py 'Descanzo' "$date - Tomar un descanzo"
fi
