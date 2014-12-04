#!/bin/bash

# Cargamos las imagenes docker

function cargar_imagen {
  echo -e "Restoring Docker Image: \e[32m$1\e[0m"
  docker load -i=$1
  rm -f $1
}

export -f cargar_imagen 

find -name "dk.*.*.gz" -exec bash -c 'cargar_imagen "$0"' {} \; 


# Imprimir imagenes

echo -e "\e[33mListado de Imagenes:\e[0m"
docker images | grep -v CREATED | awk '{print $1 " " $2 " " $4$5}'
