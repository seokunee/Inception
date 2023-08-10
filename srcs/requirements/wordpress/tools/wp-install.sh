#!/bin/bash

wp core download --path=/var/www/html

# wp-config.php 만들 수 있는 명령어인데 우리는 따로 만들거라서 주석
# wp core config --dbname=your_database_name \
#  --dbuser=your_database_user \
#  --dbpass=your_database_password \
#  --dbhost=your_database_host \
#  --dbprefix=wp_ --path=/var/www/html

wp core install --url=${WORDPRESS_URL} \
 --title=${WORDPRESS_TITLE} \
 --admin_user=${WORDPRESS_ADMIN_USER}\
 --admin_password=${WORDPRESS_ADMIN_PASSWORD} \
 --admin_email=${WORDPRESS_ADMIN_EMAIL} \
 --path=/var/www/html

wp user create ${WORDPRESS_USER} ${WORDPRESS_USER_EMAIL} --role=author --user_pass=${WORDPRESS_USER_PASSWORD}
