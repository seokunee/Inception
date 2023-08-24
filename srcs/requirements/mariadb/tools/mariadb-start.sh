#! /bin/bash

cp /var/lib/db-init.sh /var/lib/mysql/db-init.sh

cd /var/lib/mysql
sh db-init.sh

rm /var/lib/db-init.sh /var/lib/mysql/db-init.sh

/usr/bin/mysqld --skip-log-error