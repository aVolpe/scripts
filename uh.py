#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Script que obtiene las noticias de Ultima Hora

Se puede expandir para mostrar más noticias.
"""

import urllib
import urllib.request
import contextlib
from bs4 import BeautifulSoup

secciones = {
    'nacionales' : 319,
    'deportes'   : 409,
    'arte'       : 9,
    'mundo'      : 6,
    'etc'        : 40,
    'especiales' : 48
}

class bcolors:
    HEADER    = '\033[95m'
    OKBLUE    = '\033[94m'
    OKGREEN   = '\033[92m'
    WARNING   = '\033[93m'
    FAIL      = '\033[91m'
    ENDC      = '\033[0m'
    BOLD      = '\033[1m'
    UNDERLINE = '\033[4m'

def print_color(text, color):
    print(color + text + bcolors.ENDC)

def get_noticias(seccion, pag):

    """
    Realiza una petición POST para obtener las noticias

    Existen ciertos parámetros que son utilizados por defecto.

    Parámetros utilizados:
        page                 : indice que empieza en 0 y indica que noticias traer.
        arrCaracteristica[0] : valor que indica la sección a traer, ver en
                               mapa de secciones.


    TODO: verificar si algún parámetro no utilizado modifica la petición
    """

    data = urllib.parse.urlencode({
        'idsNotIn'             : [962114,962078,962080,962058,962091],
        'idCMSObjeto'          : 56,
        'page'                 : pag,
        'id'                   : 300,
        'idCMSSeccion'         : 282,
        'arrCaracteristica[0]' : seccion
    }).encode('UTF-8')
    req = urllib.request.Request("http://www.ultimahora.com/_post/ultimahora/getMoreNewsByCategory.php",
                                    data,
                                    headers={'User-Agent' : "Magic Browser"})
    with contextlib.closing(urllib.request.urlopen(req)) as response:

        soup = BeautifulSoup(response.read(), 'html.parser')

        noticias = soup.find_all('h3', 't4')

        def extract_data(noticia):
            """
            Extrae la información desde el link
            """
            a = noticia.findChildren()[0]
            return {
                'title' : a.get_text(),
                'url'   : a['href'],
            }

        return map(extract_data, noticias)

def pretty_print(data):
    print()
    print_color(data['title'], bcolors.HEADER)
    print_color(data['url'], bcolors.OKBLUE)


if __name__ == '__main__':
    data = get_noticias(secciones['arte'], 0)

    for s in secciones:
        print()
        print_color(s.upper(), bcolors.OKGREEN)
        for d in get_noticias(secciones[s], 0):
            pretty_print(d)

        print ('=============================')
