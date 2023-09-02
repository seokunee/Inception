FROM alpine:3.17

ARG PHP_VERSION=81 \
	DB_NAME \
    DB_USER \
    DB_PASSWORD \
    DB_HOST

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
	wget \
	unzip \
	curl \
	iputils \
	tini && \
	sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
	sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
	sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
	sed -i "s|;clear_env = no|clear_env = no|g" /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*

WORKDIR /var/www/html

COPY conf/wp-config-create.sh /var/www/html
COPY tools/wp-install.sh /var/www/html

EXPOSE 9000

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN sh wp-config-create.sh && rm wp-config-create.sh

CMD ["tini", "--", "/bin/sh", "wp-install.sh"]
