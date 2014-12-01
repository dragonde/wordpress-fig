#!/bin/bash

gsutil cp gs://vux/misitio.tgz . 
gsutil cp gs://vux/dump.sql mysql

docker pull mysql
fig build
