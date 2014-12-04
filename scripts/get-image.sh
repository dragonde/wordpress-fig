#!/bin/bash

segmento="gs://vux"

last_im=$(gsutil ls $segmento/dk.*.*.gz | sort | tail -n 1)

echo Backup:
echo -e "\e[33m$last_im\e[0m"

gsutil cp $last_im .
