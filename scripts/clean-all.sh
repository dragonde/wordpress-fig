#!/bin/bash

rm -rf wordpress
rm wp.*.tgz
rm dk.*.*.gz
rm dbinit/*.sql

perl -pi -e "s/^(\s+MYSQL_ROOT_PASSWORD:).*$/\1 mypassword1/" fig.yml
perl -pi -e "s/^(\s+WORDPRESS_PASSWORD:).*$/\1 mypassword2/" fig.yml
perl -pi -e "s/^(\s+-\s*\/).+(\/.+:)\s*(\/.+)\s*$/\1myrootdirectory\2\3\n/" fig.yml

perl -pi -e "s/(MYSQL_ROOT_PASSWORD=)\w+\"/\1mypassword1\"/" coreos/db.1.service
perl -pi -e "s/(WORDPRESS_PASSWORD=)\w+\"/\1mypassword2\"/" coreos/web.1.service
perl -pi -e "s#(\s+-v\s+/)\S+(/\S+:\s*/\S+)#\1myrootdirectory\2#g" coreos/web.1.service
