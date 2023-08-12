#! /bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then

        chown -R mysql:mysql /var/lib/mysql

        # init database
        mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

        tfile=`mktemp`
        if [ ! -f "$tfile" ]; then
                return 1
        fi
fi

if [ ! -d "/var/lib/mysql/wordpress" ]; then

        cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE ${MYSQL_DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED by '${MYSQL_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF
        # create_db.sql 실행 후 삭제
        /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql
        rm -f /tmp/create_db.sql
fi