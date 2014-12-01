#!/bin/bash

docker pull mysql
docker pull ubuntu:14.04

fig build
