#!/bin/bash

rm -rf wordpress
gsutil cp gs://vux/dump.sql . 
gsutil cp gs://vux/misitio.tgz .
tar zxvf misitio.tgz
rm -f misitio.tgz

docker pull mysql
docker pull ubuntu:14.04

fig build
