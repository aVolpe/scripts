#!bin/bash
echo "Matando kopete"
killall "kopete"
echo "Iniciando kopete"
nohup kopete &
echo "Cambiar a modo proxy"
. ~/scripts/to_proxy.sh proxy &
echo "Configurar monitores"
. ~/scripts/configure_monitor.sh dual VGA1 1680x1050 DER
echo "Limpiar jboss"
ruby ~/scripts/limpiar_standalone.rb
echo Entrando a eclipse
nohup /home/arturo/IDE/eclipse4.3/eclipse & > /dev/null
echo Entrando a mantis
nohup kde-open 'http://www.gmail.com/' & > /dev/null
nohup kde-open 'http://www.stackoverflow.com/' & > /dev/null
nohup kde-open 'http://cia.pol.una.py/mantis/my_view_page.php' & > /dev/null
