#!/bin/bash

rm -rf wordpress
rm wordpress-*
rm dbinit/*

perl -pi -e "s/^(\s*MYSQL_ROOT_PASSWORD:).*$/\1 mypassword/" fig.yml
perl -pi -e "s/^(\s*WORDPRESS_PASSWORD:).*$/\1 mypassword/" fig.yml
