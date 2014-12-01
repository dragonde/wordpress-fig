#!/bin/bash

if [ -f wordpress.sql ] ;
then
  docker exec -i wordpressfig_db_1 sh -c 'mysql -uroot -p$MYSQL_ROOT_PASSWORD wordpress' < wordpress.sql
else
  echo Falta wordpress.sql
fi
