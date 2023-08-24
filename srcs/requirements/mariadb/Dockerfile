FROM alpine:3.17.4

RUN apk update && \
    apk upgrade && \
	apk add --no-cache mariadb mariadb-client && \
    mkdir /var/run/mysqld && \
    chmod 777 /var/run/mysqld && \
    # skip-networking의 주석을 풀어서 mariaDB가 네트워크를 사용할 수 있도록 하였다.-> wordpress와 연결되어야하기 때문에
    sed -i "s|.*skip-networking.*|skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

WORKDIR /var/lib/mysql

EXPOSE 3306

COPY tools/db-init.sh /var/lib/db-init.sh
COPY tools/mariadb-start.sh /var/lib/mariadb-start.sh

# RUN sh /var/lib/mysql/db-init.sh && rm /var/lib/mysql/db-init.sh
# mysql
USER mysql

CMD ["sh", "/var/lib/mariadb-start.sh"]
# 백그라운드에서 mysql을 실행한다.
# CMD ["/usr/bin/mysqld"]