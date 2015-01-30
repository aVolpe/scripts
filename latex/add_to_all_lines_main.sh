# Agrega la linea %! TEX root = ../main.tex a todos los
# archivos que no contengan la linea `main.tex`


for file in `find -name "*.tex" -exec grep -v -l main.tex {} \;` 
do
    if [[ $file == */*/* ]]; then
        echo "%! TEX root = ../main.tex" | cat - $file > XXX && mv XXX $file
    fi
done
