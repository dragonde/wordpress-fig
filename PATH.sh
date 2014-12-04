#!/usr/bin/env bash

#FROM utils.sh, deis

function echo_yellow {
  echo -e "\033[0;33m$1\033[0m"
}

function echo_red {
  echo -e "\033[0;31m$1\033[0m"
}

function echo_green {
  echo -e "\033[0;32m$1\033[0m"
}

#Añadimos el directorio scritps al PATH
export PATH=$PATH:$(pwd)/scripts

