# Mariadb 와 Wordpress를 연결시키는 Makefile

all :
	mkdir -p ${PWD}/../../data/wordpress
	mkdir -p ${PWD}/../../data/mariadb

	docker network create my_network

	docker build -t wordpress wordpress/.
	docker run --name mariadb -v ${PWD}/../../data/mariadb:/var/lib/mysql --net my_network -d mariadb

	docker build -t mariadb mariadb/.
	docker run --name wordpress -p 9000:9000 -it -v ${PWD}/../../data/wordpress:/var/www/html --net my_network -d wordpress

fclean:
	-rm -rf ${PWD}/../../data
	-docker rm -f mariadb
	-docker rmi mariadb
	-docker rm -f wordpress
	-docker rmi wordpress
	-docker network rm my_network

re:			fclean all

.PHONY:		all clean fclean re
