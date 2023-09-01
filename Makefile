DATA_PATH = /home/seokchoi/data

all : 
	mkdir -p $(DATA_PATH)/wordpress
	mkdir -p $(DATA_PATH)/mariadb
	sudo docker-compose -f srcs/docker-compose.yml up --build -d

up:
	sudo docker-compose -f srcs/docker-compose.yml up -d

build:
	sudo docker-compose -f srcs/docker-compose.yml --build

down:
	sudo docker-compose -f srcs/docker-compose.yml down

clean:	down
		
fclean:		clean
			# 맥환경
			sudo rm -rf $(DATA_PATH) 
			# VM환경
			# sudo rm -rf $(DATA_PATH)
			# docker system prune -a --volumes
			-sudo docker rm nginx
			-sudo docker rm mariadb
			-sudo docker rm wordpress
			-sudo docker rmi nginx
			-sudo docker rmi mariadb
			-sudo docker rmi wordpress
			-sudo docker volume rm srcs_wordpress_volume
			-sudo docker volume rm srcs_mariadb_volume
			-sudo docker network rm srcs_my_network

re:			fclean all

.PHONY:		all clean fclean re up down build
