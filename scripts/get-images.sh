#!/bin/bash

segmento="gs://vux"

last_im_wp=$(gsutil ls $segmento/dk.nginx-wordpress.*.gz | sort | tail -n 1)
last_im_my=$(gsutil ls $segmento/dk.mysql.*.gz | sort | tail -n 1)

echo -e "Descargango: \e[33m$last_im_wp\e[0m"
gsutil cp $last_im_wp .

echo -e "Descargando: \e[33m$last_im_my\e[0m"
gsutil cp $last_im_my .

