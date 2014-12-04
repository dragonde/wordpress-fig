#!/bin/bash

# Cargamos las imagenes docker

find -name "dk.*.*.gz" -exec echo -e "Restoring Docker Image: \e[32m{}\e[0m" \;

find -name "dk.*.*.gz" -exec docker load -i={} \;

find -name "dk.*.*.gz" -exec rm -f {} \;

# Imprimir imagenes

echo -e "\e[33mListado de Imagenes:\e[0m"
docker images | grep -v CREATED | awk '{print $1 " " $2 " " $4$5}'
