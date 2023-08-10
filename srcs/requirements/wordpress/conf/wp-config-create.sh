#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
cat << EOF > /var/www/html/wp-config.php
<?php
// MariaDB 데이터베이스 정보
# define('DB_NAME', '${DB_NAME}');
# define('DB_USER', '${DB_USER}');
# define('DB_PASSWORD', '${DB_PASSWORD}');
# define('DB_HOST', '${DB_HOST}');
# define('DB_CHARSET', "utf8");

define('DB_NAME', 'wpdatabase');
define('DB_USER', 'seokchoi');
define('DB_PASSWORD', '1234');
define('DB_HOST', 'localhost');
define('DB_CHARSET', "utf8");
if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );}
require_once ABSPATH . 'wp-settings.php';
?>

EOF
fi