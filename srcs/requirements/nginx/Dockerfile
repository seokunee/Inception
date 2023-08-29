FROM alpine:3.17

RUN apk update && \
	apk upgrade && \
    apk add --no-cache nginx && \
	apk add --no-cache openssl && \
	mkdir -p /etc/nginx/ssl/private && \  
	openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/private/seokchoi.42.fr.key \
	-x509 -days 365 -out /etc/nginx/ssl/private/seokchoi.42.fr.crt \
	-subj "/C=KR/ST=Seoul/O=42Seoul/OU=seokchoi/CN=inception/" && \
	mkdir -p /var/www/html

COPY conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 443

RUN chown nginx /etc/nginx/ssl/private/seokchoi.42.fr.key && \
	chown nginx /etc/nginx/ssl/private/seokchoi.42.fr.crt && \
	chmod 600 /etc/nginx/ssl/private/seokchoi.42.fr.key && \
	chmod 600 /etc/nginx/ssl/private/seokchoi.42.fr.crt

CMD ["nginx", "-g", "daemon off;"]
