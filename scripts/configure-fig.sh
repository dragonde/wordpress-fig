#!/bin/bash

mysql_pw=$(openssl rand -base64 32 | head -c 40 | tr '/+' '01')
wordpress_pw=$(openssl rand -base64 32 | head -c 40 | tr '/+' '01')
cwd=$(pwd)


perl -pi -e "s/^(\s*MYSQL_ROOT_PASSWORD:).*$/\1 $mysql_pw/" fig.yml
perl -pi -e "s/^(\s*WORDPRESS_PASSWORD:).*$/\1 $wordpress_pw/" fig.yml
#Cuidado la variable cwd contiene /
perl -pi -e "s#/myrootdirectory#$cwd#" fig.yml


