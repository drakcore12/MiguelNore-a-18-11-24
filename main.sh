#!/bin/bash

echo "Iniciando script main.sh"

# Crear 100 archivos
for i in {1..100}; do
    echo "Este es el archivo $i" > /MiguelNorena2772878/archivo$i.txt
done

echo "Script completado"
