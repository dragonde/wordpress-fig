#!/bin/bash

  chown -R www-data:www-data /www

  sleep 5;

  mysql -uroot -p$DB_ENV_MYSQL_ROOT_PASSWORD -h db -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ENV_MYSQL_ROOT_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"

  mysql -uroot -p$DB_ENV_MYSQL_ROOT_PASSWORD -h db -e "CREATE DATABASE wordpress;"
  
  mysql -uroot -p$DB_ENV_MYSQL_ROOT_PASSWORD -h db -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%' IDENTIFIED BY '$DB_ENV_WORDPRESS_PASSWORD'; FLUSH PRIVILEGES;"

# start all the services
/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
