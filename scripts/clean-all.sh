#!/bin/bash

rm -rf wordpress
rm wp.*.tgz
rm dk.*.*.gz
rm dbinit/*.sql

perl -pi -e "s/^(\s+MYSQL_ROOT_PASSWORD:).*$/\1 mypassword/" fig.yml
perl -pi -e "s/^(\s+WORDPRESS_PASSWORD:).*$/\1 mypassword/" fig.yml
perl -pi -e "s/^(\s+-\s*\/).+(\/.+:)\s*(\/.+)\s*$/\1myrootdirectory\2\3\n/" fig.yml

