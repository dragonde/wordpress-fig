#!/bin/bash

fecha=$(date +%y%m%d-%H%M)
file='/tmp/wordpress.sql'

docker exec wordpressfig_db_1 mysqldump -p234567 wordpress > $file  
tar zcvf /tmp/wordpress.tgz wordpress

if [ -f $file ];
then
  gsutil cp $file gs://vux/wordpress-$fecha.sql
  rm -f $file
fi

if [ -f /tmp/wordpress.tgz ];
then
  gsutil cp /tmp/wordpress.tgz  gs://vux/wordpress-$fecha.tgz
  rm -f /tmp/wordpress.tgz
fi

