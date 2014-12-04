#!/bin/bash

### Freshhhh copy of WordPress con NGINX Helper


  WORDPRESS_DB="wordpress"

# solo si no existe wordpress

if [ ! -d "wordpress" ]; 
then


#Download Fresh copy wordpress
  curl https://wordpress.org/latest.tar.gz | tar -xvzf -
 
  sed -e "s/database_name_here/$WORDPRESS_DB/
  s/username_here/$WORDPRESS_DB/
  s/password_here/mypassword/
  s/localhost/db:3306/
  /'AUTH_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'SECURE_AUTH_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'LOGGED_IN_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'NONCE_KEY'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'AUTH_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'SECURE_AUTH_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'LOGGED_IN_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/
  /'NONCE_SALT'/s/put your unique phrase here/`pwgen -c -n -1 65`/" wordpress/wp-config-sample.php > wordpress/wp-config.php

 # Download nginx helper plugin
  curl -O `curl -i -s https://wordpress.org/plugins/nginx-helper/ | egrep -o "https://downloads.wordpress.org/plugin/[^']+"`
  unzip -o nginx-helper.*.zip -d wordpress/wp-content/plugins
  rm -f nginx-helper.*.zip

#Activate nginx plugin and set up pretty permalink structure once logged in
  cat << ENDL >> wordpress/wp-config.php
\$plugins = get_option( 'active_plugins' );
if ( count( \$plugins ) === 0 ) {
  require_once(ABSPATH .'/wp-admin/includes/plugin.php');
  \$wp_rewrite->set_permalink_structure( '/%postname%/' );
  \$pluginsToActivate = array( 'nginx-helper/nginx-helper.php' );
  foreach ( \$pluginsToActivate as \$plugin ) {
    if ( !in_array( \$plugin, \$plugins ) ) {
      activate_plugin( '/usr/share/nginx/www/wp-content/plugins/' . \$plugin );
    }
  }
}
ENDL

else
  echo "WordPress EXISTE!!! No se puede Inicializar"
fi
