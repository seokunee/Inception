# 어떤 base image를 쓸건지 정함.
# FROM nginx:latest
FROM alpine:3.16

RUN apk update && \
    apk add nginx && \
	apk add openssl && \
	mkdir -p /etc/nginx/ssl/private && \  
	openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/private/seokchoi.42.fr.key \
	-x509 -days 365 -out /etc/nginx/ssl/private/seokchoi.42.fr.crt \
	-subj "/C=KR/ST=Seoul/O=42Seoul/OU=seokchoi/CN=inception/"

# 어떤 디렉토리에 있는 파일들을 복사해올지 정함 WORKDIR는 명령어 cd랑 같은 것이다. 아직 이 위치에는 아무것도 없고 COPY 명령어로 파일들을 복사해서 WORKDIR에 복사해올 것이다.
WORKDIR /usr/share/nginx/html

# 호스트의 현재 디렉토리에 있는 파일을 컨테이너 내부로 복사
COPY tools /usr/share/nginx/html/
COPY conf/default.conf /etc/nginx/nginx.conf

# 컨테이너의 포트를 외부에 노출
EXPOSE 443

# 보안상의 이유로 root 사용자만 개인 키 파일에 액세스할 수 있도록 구성합니다.
RUN chown root:root /etc/nginx/ssl/private/seokchoi.42.fr.key && \
	chown root:root /etc/nginx/ssl/private/seokchoi.42.fr.crt && \
	chmod 600 /etc/nginx/ssl/private/seokchoi.42.fr.key && \
	chmod 600 /etc/nginx/ssl/private/seokchoi.42.fr.crt

# nginx를 포그라운드에서 실행시킴. 포그라운드에서 실행시키면 이벤트 로그
CMD ["nginx", "-g", "daemon off;"]
