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

# WORKDIR /usr/share/nginx/html

# COPY conf/default.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/http.d/default.conf


# 컨테이너의 포트를 외부에 노출
EXPOSE 443

# 보안상의 이유로 root 사용자만 개인 키 파일에 액세스할 수 있도록 구성합니다.
# RUN chown nginx /etc/nginx/ssl/private/seokchoi.42.fr.key && \
# 	chown nginx /etc/nginx/ssl/private/seokchoi.42.fr.crt && \
# 	chmod 600 /etc/nginx/ssl/private/seokchoi.42.fr.key && \
# 	chmod 600 /etc/nginx/ssl/private/seokchoi.42.fr.crt

# nginx를 포그라운드에서 실행시킴. 포그라운드에서 실행시키면 이벤트 로그
CMD ["nginx", "-g", "daemon off;"]
