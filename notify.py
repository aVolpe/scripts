#!/usr/bin/env python
"""This is a python 2.5 script that creates a notification using dbus."""
import sys
import dbus
item = ('org.freedesktop.Notifications')
path = ('/org/freedesktop/Notifications')
interface = ('org.freedesktop.Notifications')

arguments =  ' '.join(sys.argv[2:])

icon = '/home/arturo/scripts/images/terere.jpeg'
array = ''
hint = ''
time = 500   # Use seconds x 1000
app_name = ('Test Application')
title = (sys.argv[1])
body = (arguments)

bus = dbus.SessionBus()
notif = bus.get_object(item, path)
notify = dbus.Interface(notif, interface)
notify.Notify(app_name, 0, icon, title, body, array, hint, time)
