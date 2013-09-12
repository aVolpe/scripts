#!/usr/bin/python
import sys
import os
import pickle
import datetime
from subprocess import call

usage = '''
Abre un video con 'kde-open' y lo anota como visto,
si se abre un archivo ya visto, notifica y espera
una confirmacion para reproducirlo.
'''

MAP_LOCATION = '/home/arturo/.map_series'

if len(sys.argv) != 2:
    print usage


def load_map():
    if not os.path.exists(MAP_LOCATION):
        mapa = {}
        return mapa
    pkl_file = open(MAP_LOCATION, 'rb')
    mydict2 = pickle.load(pkl_file)
    pkl_file.close()
    return mydict2


def save_map(mapa):
    output = open(MAP_LOCATION, 'wb')
    pickle.dump(mapa, output)
    output.close()


def ver(mapa, filename, veces_visto):
    if not veces_visto:
        veces_visto = [datetime.datetime.now()]
    else:
        veces_visto.append(datetime.datetime.now())
    mapa[filename] = veces_visto
    save_map(mapa)
    print "Ejecutando {0} {1}".format('kde-open', filename)
    call(['kde-open', filename])


def preguntar():
    respuesta = raw_input("Desea verlo? (S - defecto, N): ")
    if respuesta == "" or respuesta.upper() == "S" or respuesta.upper() == "Y":
        return True
    else:
        return False


filename = sys.argv[1]

if not os.path.exists(filename):
    print "No existe el archivo {0}".format(filename)
    exit()

if os.path.isdir(filename):
    print "No existe el archivo (es un directorio) {0}".format(filename)
    exit()

print "Viendo archivo: {0}".format(filename)
mapa = load_map()
if not filename in mapa:
    print "Capitulo nunca visto"
    if preguntar():
        ver(mapa, filename, None)
    else:
        exit()


else:
    print "Capitulo ya visto"
    array = mapa[filename]
    for fecha in array:
        print "Visto el: {0}".format(fecha.strftime("%Y-%m-%d %H:%M"))
    if preguntar():
        ver(mapa, filename, array)
    else:
        exit()
