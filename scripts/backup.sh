#!/bin/bash

fecha=$(date +%y%m%d-%H%M)
segment='gs://vux'


docker exec -i wordpressfig_db_1 sh -c 'mysqldump -p$MYSQL_ROOT_PASSWORD wordpress' > wordpress.sql  

tar zcvf wordpress.tgz fig.yml wordpress.sql wordpress 

gsutil cp wordpress.tgz $segment/wordpress-$fecha.tgz

rm -f wordpress.tgz wordpress.sql

