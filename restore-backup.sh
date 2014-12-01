#!/bin/bash

if [ -f wordpress.tgz ] ;
then
  rm -rf wordpress
  tar zxvf wordpress.tgz
else 
  echo Falta Ficheros wordpress.tgz 
fi
