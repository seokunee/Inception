#!/bin/bash

# export > /var/www/html/abc.txt

mv /var/www/wp-config-create.sh /var/www/html/wp-config-create.sh
cp /var/www/wp-install.sh /var/www/html/wp-install.sh

sh wp-config-create.sh
sh wp-install.sh

rm /var/www/html/wp-config-create.sh
rm /var/www/wp-config-create.sh
rm /var/www/html/wp-config-create.sh
rm /var/www/wp-start.sh 