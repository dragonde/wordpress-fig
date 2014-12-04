#!/bin/bash

fecha=$(date +%y%m%d-%H%M)
segment='gs://vux'


docker exec -i wordpressfig_db_1 sh -c 'mysqldump -p$MYSQL_ROOT_PASSWORD wordpress' > dbinit/wordpress.sql  

tar zcvf wordpress.tgz fig dbinit/wordpress.sql wordpress 

gsutil cp wordpress.tgz $segment/wp.$fecha.tgz

rm -f wordpress.tgz 

