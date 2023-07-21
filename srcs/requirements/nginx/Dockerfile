# 어떤 base image를 쓸건지 정함.
# FROM nginx:latest
FROM alpine:3.16

# 어떤 디렉토리에 있는 파일들을 복사해올지 정함. WORKDIR는 명령어 cd랑 같은 것이다. 아직 이 위치에는 아무것도 없고 COPY 명령어로 파일들을 복사해서 WORKDIR에 복사해올 것이다. 
WORKDIR /usr/share/nginx/html

# 호스트의 현재 디렉토리에 있는 파일을 컨테이너 내부로 복사
COPY tools /usr/share/nginx/html/
COPY conf/defaul.conf /etc/nginx/nginx.conf

# 컨테이너의 포트를 외부에 노출
EXPOSE 443


# 보안상의 이유로 root 사용자만 개인 키 파일에 액세스할 수 있도록 구성합니다.
RUN chown root:root /etc/ssl/private/seokchoi.42.fr.key
RUN chmod 600 /etc/ssl/private/seokchoi.42.fr.key

CMD ["nginx", "-g", "daemon off;"]



# FROM node:18-alpine
# WORKDIR /app/nginx
# COPY tools /app/nginx
# RUN yarn install --production
# CMD ["node", "index.js"]
# EXPOSE 3000