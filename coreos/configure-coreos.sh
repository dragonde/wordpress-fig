#!/bin/bash

mysql_pw=$(openssl rand -base64 32 | head -c 40 | tr '/+' '01')
wordpress_pw=$(openssl rand -base64 32 | head -c 40 | tr '/+' '01')
cwd=$(pwd)

sed -i -re "s/mypassword1/$mysql_pw/" db.1.service
sed -i -re "s/mypassword2/$wordpress_pw/" web.1.service
sed -i -re "s#/myrootdirectory#$cwd#g" web.1.service

