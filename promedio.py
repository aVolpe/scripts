import json


#Para obtener este archivo vaya a la pagina web.pol.una.py,
#y luego consulte todas la notas, copie y pege el resultado de la llamada

data = json.load(file('result.json', 'r'))

#print data['msg']

count = 0.0
suma = 0.0
prom_sum = 0.0
prom_fin = 0.0
for nota in data['data']:
	#Omitimos pasantia
	if nota['asignatura'] == 'PASANTIA':
		print 'Omitiendo {0}'.format(nota['asignatura'])
		continue
	count += 1.0
	suma += nota['nota']
	prom_sum += nota['promedio']
	if not nota['porcentajeExamen'] :
		print 'La materia {0} no tiene nota de finales'.format(nota['asignatura'])
	else:
		prom_fin += nota['porcentajeExamen']

print 'Se rindieron {0} materias.'.format(count)
print 'El promedio es {0}:'.format(suma / count)
print 'El promedio del promedio de parciales es {0}'.format(prom_sum / count)
print 'El promedio de las notas del examen final es {0}'.format(prom_fin / count)
