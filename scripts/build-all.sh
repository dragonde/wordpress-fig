#!/bin/bash

docker pull mysql
docker pull ubuntu:14.10
docker build -t dragonde/nginx-wordpress webserver

