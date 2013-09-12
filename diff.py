#!/usr/bin/python
# Script para utilizar meld como visor por defecto de
# git diff.
# uso:
# git config diff.tool ~/scripts/diff.py
import sys
import os

os.system('meld "%s" "%s"' % (sys.argv[2], sys.argv[5]))
