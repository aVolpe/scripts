#!bin/bash
rm ~/.proxy_status
echo "WITH PROXY" > ~/.proxy_status

echo "Matando kopete"
killall "kopete"
echo "Cambiar a modo proxy"
. ~/scripts/to_proxy.sh proxy &
echo "Configurar monitores"
. ~/scripts/configure_monitor.sh dual VGA1 1680x1050 IZQ
#. ~/scripts/configure_monitor.sh dual VGA2 1680x1050 IZQ

echo "Limpiar jboss"
ruby ~/scripts/limpiar_standalone.rb
echo Entrando a eclipse
nohup ~/IDE/eclipse/eclipse & > /dev/null
echo Iniciando chrome
nohup google-chrome 'http://www.gmail.com/' &
nohup google-chrome 'http://www.stackoverflow.com/' &
#echo Iniciando kopete
#cp ~/.kde4/share/config/kopeterc_withavolpe ~/.kde4/share/config/kopeterc
#proxychains4 kopete
pidgin &
#sudo service postgresql start

yakuake-session -t 'WIKI' -q -e vim ~/etc/Dropbox/wiki/index.wiki
