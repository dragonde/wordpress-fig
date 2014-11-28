#!/bin/bash
  WORDPRESS_DB="wordpress"
  MYSQL_PASSWORD="234567"
  WORDPRESS_PASSWORD=`pwgen -c -n -1 12`

  chown -R www-data:www-data /data

  sleep 10;

  mysqladmin -u root --password=$MYSQL_PASSWORD -h db
  mysql -uroot -p$MYSQL_PASSWORD -h db -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"
  mysql -uroot -p$MYSQL_PASSWORD -h db -e "CREATE DATABASE wordpress; GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY '$WORDPRESS_PASSWORD'; FLUSH PRIVILEGES;"

# start all the services
/usr/local/bin/supervisord -n
