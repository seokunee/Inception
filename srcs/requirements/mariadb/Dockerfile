FROM alpine:3.16

# 환경 변수 설정
ENV MYSQL_ROOT=root \
    MYSQL_ROOT_PASSWORD=rootpass \
    MYSQL_DB_NAME=inception \
    MYSQL_USER=seokchoi \
    MYSQL_USER_PASSWORD=userpass

RUN apk update && \
	apk add --no-cache mariadb mariadb-client && \
    mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    # skip-networking의 주석을 풀어서 mariaDB가 네트워크를 사용할 수 있도록 하였다.-> wordpress와 연결되어야하기 때문에
    sed -i "s|.*skip-networking.*|skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

WORKDIR /var/lib/mysql

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

COPY tools/db-init.sh /var/lib/mysql/db-init.sh

RUN sh /var/lib/mysql/db-init.sh && rm /var/lib/mysql/db-init.sh

USER mysql
# 백그라운드에서 mysql을 실행한다.
CMD ["/usr/bin/mysqld"]
