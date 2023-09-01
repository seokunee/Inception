FROM alpine:3.17

ARG DB_NAME \
    DB_USER \
    DB_PASSWORD \
    DB_HOST

RUN apk update && \
    apk upgrade && \
	apk add --no-cache mariadb mariadb-client tini && \
    mkdir /run/mysqld && \
    chmod 777 /run/mysqld && \
    sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i "s/#bind-address=0.0.0.0/bind-address=0.0.0.0/g" /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

COPY tools/db-init.sh /db-init.sh

USER mysql

CMD ["tini", "--", "/bin/sh", "/db-init.sh"]
