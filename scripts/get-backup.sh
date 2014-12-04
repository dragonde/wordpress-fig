#!/bin/bash

segmento="gs://vux"

ultimo_bk=$(gsutil ls $segmento/wp.*.tgz | sort | tail -n 1)

echo Backup:
echo $ultimo_bk

gsutil cp $ultimo_bk .
#gsutil cp $segmento/*.im.gz .

# cargamos las imagenes
#find -name "*.im.gz" -exec docker load -i={} \;
