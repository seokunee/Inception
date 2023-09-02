# DATA_PATH = /home/seokchoi/data
DATA_PATH = ${PWD}/data

all :
	mkdir -p $(DATA_PATH)/wordpress
	mkdir -p $(DATA_PATH)/mariadb
	docker-compose -f srcs/docker-compose.yml up --build -d

up:
	docker-compose -f srcs/docker-compose.yml up -d

build:
	docker-compose -f srcs/docker-compose.yml --build

down:
	docker-compose -f srcs/docker-compose.yml down

clean:	down

fclean:		clean
			rm -rf $(DATA_PATH)
			# docker system prune -a --volumes
			-docker rm nginx
			-docker rm mariadb
			-docker rm wordpress
			-docker rmi nginx
			-docker rmi mariadb
			-docker rmi wordpress
			-docker volume rm srcs_wordpress_volume
			-docker volume rm srcs_mariadb_volume
			-docker network rm srcs_my_network

re:			fclean all

.PHONY:		all clean fclean re up down build
