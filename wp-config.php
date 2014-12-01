<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'root');
define('DB_PASSWORD', '234567');
define('DB_HOST', "db:3306");
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

// https://api.wordpress.org/secret-key/1.1/salt/ 
define('AUTH_KEY',         '<<Y)Tc0ai:b@~Eky[oSHMEO+btP+rJ{3%r`o>-ByTW^+U97SCBA%oUNgFrn`:f;>');
define('SECURE_AUTH_KEY',  ' IWwy6K-MG!d-Ha>C[[dM-0Rsj!JS+Oj<2*lKrAnkC7Su=Qo17{O0~z~ j fkx,R');
define('LOGGED_IN_KEY',    ')]TauPFidS>/xnI1[w[]t12Ne?+vXXb|+DC#;CVzz4*wKi*&kK]&W3&LNR)sr7R$');
define('NONCE_KEY',        'doc?-+^uR@Qv/=/R2ZG&KPil&/N:Lxp+Ze)tc&+>sGkRjwl-^++xr+?E jMp-24-');
define('AUTH_SALT',        'Del4P7@-|0A96YR%x^Xs6s|r]&W.b}R/SKwDDG}K;!Zr#qA$|N8Qcv8N[M;/GZfX');
define('SECURE_AUTH_SALT', '@.Dx*$*dzm u9[|/kq2j+dEP?=3oUy@`V-<t}ai_V)DJZvnz-dJH-EC>h+)rG|M|');
define('LOGGED_IN_SALT',   ':-OA(E<OKaxB(r;W@bp{~plwgE*l%4Nn#?L1<EN>z6M9HrBP-C5P5:9vv@q2=By7');
define('NONCE_SALT',       'n`|Jl=!N~Kp8O.^C+!asrZ:YG0`{wr|?rMt$0gKEn:`N.KH1iG@q7=v,xp}`W=9,');

$table_prefix  = 'wp_';
define('WPLANG', '');
define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
$plugins = get_option( 'active_plugins' );
if ( count( $plugins ) === 0 ) {
  require_once(ABSPATH .'/wp-admin/includes/plugin.php');
  $wp_rewrite->set_permalink_structure( '/%postname%/' );
  $pluginsToActivate = array( 'nginx-helper/nginx-helper.php' );
  foreach ( $pluginsToActivate as $plugin ) {
    if ( !in_array( $plugin, $plugins ) ) {
      activate_plugin( '/usr/share/nginx/www/wp-content/plugins/' . $plugin );
    }
  }
}

