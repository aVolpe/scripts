#!/bin/bash

cd ~/develop/facultad/reports/

echo "Recuperando desde preapp"
scp -r avolpe@predb.med.una.py:reports reports

echo "Recuperando desde app"
scp -r avolpe@db.med.una.py:reports reports

echo "Enviando a test"
scp -r reports/ avolpe@test-cia01.pol.una.py:/var/www/html/
