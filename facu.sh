#!bin/bash
rm ~/.proxy_status
echo "WITH PROXY" > ~/.proxy_status

echo "Matando kopete"
killall "kopete"
echo "Cambiar a modo proxy"
. ~/scripts/to_proxy.sh proxy &
echo "Configurar monitores"
. ~/scripts/configure_monitor.sh dual VGA1 1680x1050 IZQ
echo "Limpiar jboss"
ruby ~/scripts/limpiar_standalone.rb
echo Entrando a eclipse
nohup /home/arturo/IDE/eclipse/eclipse & > /dev/null
echo Iniciando chrome
nohup google-chrome 'http://www.gmail.com/' &
nohup google-chrome 'http://www.stackoverflow.com/' &
nohup google-chrome 'http://cia.pol.una.py/mantis/my_view_page.php' &
echo Iniciando kopete
cp /home/arturo/.kde4/share/config/kopeterc_withavolpe /home/arturo/.kde4/share/config/kopeterc
proxychains4 kopete

