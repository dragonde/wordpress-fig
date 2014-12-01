#!/bin/bash

  #Download Fresh copy wordpress

  curl https://wordpress.org/latest.tar.gz | tar -xvzf -

  # Download nginx helper plugin
  curl -O `curl -i -s https://wordpress.org/plugins/nginx-helper/ | egrep -o "https://downloads.wordpress.org/plugin/[^']+"`
  unzip -o nginx-helper.*.zip -d wordpress/wp-content/plugins
  rm -f nginx-helper.*.zip
 
  cp -fv wp-config.php wordpress
