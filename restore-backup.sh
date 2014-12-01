#!/bin/bash

docker exec wordpressfig_db_1 sh -c 'mysql -uroot -p$MYSQL_ROOT_PASSWORD' < dump.sql
