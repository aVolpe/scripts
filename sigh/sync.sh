# Grep sin git
alias grep=grep\ --exclude-dir=.git\ --exclude-dir=.settings\ --exclude-dir=base

# Reemplazar todo por pol.karaku
grep -r -l py.una.med.base | xargs sed -i 's/med\.base/pol.karaku/g'

# Reemplaza todos las class *SIGH* por *Karaku*
grep -r -l "SIGH" | xargs sed -i 's/SIGH/Karaku/g'

# Reemplaza KarakuConfiguration por KarakuBaseConfiguration
grep -r -l "KarakuConfiguration" --exclude-dir=.git | xargs sed -i 's/KarakuConfiguration/KarakuBaseConfiguration/g'


###########
# En este pundo no debe haber mas errores de compilación
# 
# Solucion:
# * SIGHConverterV2 eliminar, utilizar KarakuConverter.INSTANCE
###########


#############
#           #
# Parte JSF #
#           #
#############

# Reemplaza la definición de sigh por k
grep -r -l "xmlns:sigh" | xargs sed -i 's/xmlns:sigh/xmlns:k/g'

# Reemplaza la url de los componentes sigh
grep -r -l "/composite/sigh" | xargs sed -i 's/composite\/sigh/composite\/karakucc/g'


# Reemplaza la utilización de los tags
grep -r -l "<sigh:" | xargs sed -i 's/<sigh:/<k:/g'

# Reemplaza el cierre de los tags
grep -r -l "</sigh:" | xargs sed -i 's/<\/sigh:/<\/k:/g'

