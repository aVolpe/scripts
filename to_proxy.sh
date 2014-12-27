#!/bin/sh


# Ver http:/patrick-nagel.net/scripts/kproxyswitch/kproxyswitch.sh

HOME="/home/avolpe"

#CONFIGURACION
TO_PROXY="proxy"
TO_NO_PROXY=""
#MAVEN
MAVEN_SETTING_PROXY="$HOME/.m2/settings.xml_proxy"
MAVEN_SETTING_NO_PROXY="$HOME/.m2/settings.xml_no_proxy"
MAVEN_SETTING="$HOME/.m2/settings.xml"
#Enviroment (no se por qu eno esta configurado)
ENVIROMENT_SETTINGS="/etc/environment"
ENVIROMENT_SETTINGS_PROXY="/etc/environment_proxy"
ENVIROMENT_SETTINGS_NO_PROXY="/etc/environment_no_proxy"

############################
#HAMACHI (instalar hamachi)#
############################
#HAMACHI_SETTINGS="/var/lib/logmein-hamachi/h2-engine-override.cfg"
#HAMACHI_SETTINGS_NO_PROXY="/var/lib/logmein-hamachi/h2-engine-override.cfg_no_proxy"
#HAMACHI_SETTINGS_PROXY="/var/lib/logmein-hamachi/h2-engine-override.cfg_proxy"

#PIDGIN
#PIDGIN="/.purple/accounts.xml"
#PIDGIN_PROXY="/.purple/accounts.xml_proxy"
#PIDGIN_NO_PROXY="/.purple/accounts.xml_no_proxy"


#KDE PROXY
KDE="$HOME/.kde4/share/config/kioslaverc"
KDE_NO_PROXY="$HOME/.kde4/share/config/kioslaverc.no_proxy"
KDE_PROXY="$HOME/.kde4/share/config/kioslaverc.proxy"


#SUSE PROXY
YAST="/etc/sysconfig/proxy"
YAST_PROXY="/etc/sysconfig/proxy_proxy"
YAST_NO_PROXY="/etc/sysconfig/proxy_no_proxy"

copy (){
  echo "Copiando " $1 " a " $2
  sudo cp "$1" "$2"
}

if [[ $1 == $TO_PROXY ]] 
then
  echo "###################################"
  echo "# Creando configuracion con proxy #"
  echo "###################################"
  copy $MAVEN_SETTING_PROXY $MAVEN_SETTING
  #echo "Copiando configuracion de proxy de entorno"
  copy $ENVIROMENT_SETTINGS_PROXY $ENVIROMENT_SETTINGS
  copy $KDE_PROXY $KDE
  copy $YAST_PROXY $YAST
  copy $PIDGIN_PROXY $PIDGIN
  #copy $HAMACHI_SETTINGS_PROXY $HAMACHI_SETTINGS
fi
if [[ $1 == $TO_NO_PROXY ]] 
then
  echo "###################################"
  echo "# Creando configuracion sin proxy #"
  echo "###################################"
  copy $MAVEN_SETTING_NO_PROXY $MAVEN_SETTING
  #echo "Copiando configuracion de proxy de entorno"
  copy $ENVIROMENT_SETTINGS_NO_PROXY $ENVIROMENT_SETTINGS
  copy $KDE_NO_PROXY $KDE
  copy $YAST_NO_PROXY $YAST
  copy $PIDGIN_NO_PROXY $PIDGIN
  #copy $HAMACHI_SETTINGS_NO_PROXY $HAMACHI_SETTINGS
fi
echo "Notificando..."
#dbus-send --type=signal /KIO/Scheduler org.kde.KIO.Scheduler.reparseSlaveConfiguration string:""

echo "###############################"
echo "######## FINALIZANDO ##########"
echo "###############################"
