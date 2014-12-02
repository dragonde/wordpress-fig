#!/bin/bash

docker pull mysql
docker pull ubuntu:14.10

fig build
