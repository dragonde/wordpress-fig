#!/bin/bash

mysql_pw=$(pwgen -c -n -1 32)
wordpress_pw=$(pwgen -c -n -1 32)

perl -pi -e "s/^(\s*MYSQL_ROOT_PASSWORD:).*$/\1 $mysql_pw/" fig.yml

perl -pi -e "s/^(\s*WORDPRESS_PASSWORD:).*$/\1 $wordpress_pw/" fig.yml
