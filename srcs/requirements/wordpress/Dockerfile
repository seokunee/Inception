FROM alpine:3.16

ARG PHP_VERSION=8

# ARG PHP_VERSION=8 \
# 	DB_NAME \
# 	DB_USER \
# 	DB_PASSWORD \
# 	DB_HOS

ENV DB_NAME=wpdatabase \
	DB_USER=seokchoi \
	DB_PASSWORD=1234 \
	DB_HOST=localhost \
	WORDPRESS_URL=seokchoi.42.fr \
	WORDPRESS_TITLE=inception \
	WORDPRESS_ADMIN_USER=seokchoi  \
	WORDPRESS_ADMIN_PASSWORD=1234 \
	WORDPRESS_ADMIN_EMAIL=seokchoi@student.42seoul.kr  \
	WORDPRESS_USER=user \
	WORDPRESS_USER_PASSWORD=1234 \
	WORDPRESS_USER_EMAIL=user@example.com 

RUN apk update && \
	apk upgrade && \
	apk add --no-cache \
	php${PHP_VERSION} \
	php${PHP_VERSION}-fpm \
	php${PHP_VERSION}-json \
	php${PHP_VERSION}-curl \
	php${PHP_VERSION}-mysqli \
	php${PHP_VERSION}-mysqlnd \
	php${PHP_VERSION}-session \
	php${PHP_VERSION}-json \
	php${PHP_VERSION}-iconv \
	php${PHP_VERSION}-fileinfo \
	php${PHP_VERSION}-xmlreader \
	php${PHP_VERSION}-ctype \
	php${PHP_VERSION}-pdo \
	php${PHP_VERSION}-pdo_mysql \
	php${PHP_VERSION}-phar \
	curl 

WORKDIR /var/www/html

EXPOSE 9000

COPY conf/wp-config-create.sh /var/www/html/wp-config-create.sh
COPY tools/wp-install.sh /var/www/html/wp-install.sh

# wp-cli 설치
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# wp-config.sh 생성 후 wp-config-create.sh은 필요없어서 삭제
RUN sh /var/www/html/wp-config-create.sh && rm /var/www/html/wp-config-create.sh

CMD ["/bin/sh", "/var/www/html/wp-install.sh"]