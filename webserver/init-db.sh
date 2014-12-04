#!/bin/bash

dbinit_file='/dbinit/wordpress.sql'

### exportar para start.sh

### Ojo, sed -r, compatibilidad perl

export DBHOST=$(env | grep PORT_3306_TCP_ADDR | tail -n 1 | sed -re "s/^.+=//")

echo -e "\e[32mEsperando a BBDD en \e[35m$DBHOST"

### Esperamos a que la BBDD se levante

sleep 1;
while ! nc -vz $DBHOST 3306; do sleep 2; done
sleep 1;

echo -e "\e[32mCreando Tabla \e[34mwordpress\e[32m en BBDD"

  mysql -uroot -p$DB_ENV_MYSQL_ROOT_PASSWORD -h $DBHOST -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ENV_MYSQL_ROOT_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"

  mysql -uroot -p$DB_ENV_MYSQL_ROOT_PASSWORD -h $DBHOST -e "CREATE DATABASE wordpress; GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%' IDENTIFIED BY '$WORDPRESS_PASSWORD'; FLUSH PRIVILEGES;"

if [ -f $dbinit_file ];
then
  mysql -uwordpress -p$WORDPRESS_PASSWORD -h $DBHOST wordpress < $dbinit_file
  echo -e "\e[31mRestaurando Copia en BBDD: \e[36m $dbinit_file"
  ### Eliminar para que si hay reinicio no recarge y planche cambios
  rm -f $dbinit_file
fi
