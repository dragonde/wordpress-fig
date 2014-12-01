#!/bin/bash

docker exec wordpressfig_db_1 mysqldump --all-databases --password=234567 > dump.sql  
