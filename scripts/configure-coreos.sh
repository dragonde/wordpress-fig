#!/bin/bash

mysql_pw=$(pwgen -c -n -1 32)
wordpress_pw=$(pwgen -c -n -1 32)
cwd=$(pwd)


perl -pi -e "s/mypassword1/$mysql_pw/" coreos/db.1.service
perl -pi -e "s/mypassword2/$wordpress_pw/" coreos/web.1.service

#Cuidado la variable cwd contiene /
perl -pi -e "s#/myrootdirectory#$cwd#g" coreos/web.1.service

