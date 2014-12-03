#!/bin/bash

  chown -R www-data:www-data /www

  /init-db.sh 

### Fijamos la password en wordpress

echo -e "\e[32mFijando la contraseña en \e[34mwp-config.php\e[32m ..."

perl -pi -e "s/^\s*define.+'DB_PASSWORD'.+$/define\('DB_PASSWORD', '$WORDPRESS_PASSWORD'\);/" /www/wp-config.php



# start all the services
  
  /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

