#!/bin/bash

tar zxvf wordpress-*.tgz 

if [ -f wordpress.sql ] ;
then
  docker exec -i wordpressfig_db_1 sh -c 'mysql -uroot -p$MYSQL_ROOT_PASSWORD wordpress' < wordpress.sql
  rm wordpress.sql
else
  echo Falta wordpress.sql
fi

fig restart
