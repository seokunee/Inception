#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
cat << EOF > /var/www/html/wp-config.php
<?php
// MariaDB 데이터베이스 정보
define('DB_NAME', '${MYSQL_DB_NAME}');
define('DB_USER', '${MYSQL_USER}');
define('DB_PASSWORD', '${MYSQL_USER_PASSWORD}');
define('DB_HOST', 'localhost');
define('DB_CHARSET', "utf8");

if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );}
require_once ABSPATH . 'wp-settings.php';
?>

EOF
fi