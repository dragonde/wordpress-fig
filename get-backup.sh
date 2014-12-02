#!/bin/bash

segmento="gs://vux"

ultimo_bk=$(gsutil ls $segmento/wordpress-*.tgz | sort | tail -n 1)

echo Backup:
echo $ultimo_bk

gsutil cp $ultimo_bk .
