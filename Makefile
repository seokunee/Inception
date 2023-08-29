all : 
	# VM환경
	# mkdir -p ~/data/wordpress
	# mkdir -p ~/data/mariadb
	
	# 맥환경
	mkdir -p ${PWD}/data/wordpress
	mkdir -p ${PWD}/data/mariadb
	docker-compose -f srcs/docker-compose.yml up --build -d

up:
	docker-compose -f srcs/docker-compose.yml up -d

build:
	# VM환경
	# mkdir -p ~/data/wordpress
	# mkdir -p ~/data/mariadb
	# 맥환경
	mkdir -p ${PWD}/data/wordpress
	mkdir -p ${PWD}/data/mariadb
	docker-compose -f srcs/docker-compose.yml --build

down:
	docker-compose -f srcs/docker-compose.yml down

clean:	down
		
fclean:		clean
			# 맥환경
			rm -rf ${PWD}/data 
			# VM환경
			# sudo rm -rf /home/seokchoi/data
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
