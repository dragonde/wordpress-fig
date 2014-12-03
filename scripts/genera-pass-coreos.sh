#!/bin/bash

mysql_pw=$(pwgen -c -n -1 32)
wordpress_pw=$(pwgen -c -n -1 32)

perl -pi -e "s/(\"MYSQL_ROOT_PASSWORD=).+\"/\1$mysql_pw\"/" coreos/db.1.service

perl -pi -e "s/(\"WORDPRESS_PASSWORD=).+\"/\1$wordpress_pw\"/" coreos/web.1.service

perl -pi -e "s#/root/#/home/core/#g" coreos/web.1.service
