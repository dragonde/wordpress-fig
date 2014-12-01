#!/bin/bash

if [ -f wordpress.tgz ] ;
then
  docker exec -i wordpressfig_db_1 sh -c 'mysql -uroot -p$MYSQL_ROOT_PASSWORD' < wordpress.sql
  rm -rf wordpress
  tar zxvf wordpress.tgz
else 
  echo Faltan Ficheros wordpress .tgz y .sql
fi
