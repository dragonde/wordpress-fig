#!/bin/bash

dbinit='dbinit/wordpress.sql'

if [ -f $dbinit ] ;
then
  docker exec -i wordpressfig_db_1 sh -c 'mysql -uroot -p$MYSQL_ROOT_PASSWORD wordpress' < $dbinit
else
  echo $dbinit
fi

