# Mariadb 를 위한 Makefile
all : 
	mkdir -p ${PWD}/../../../data/mariadb
	docker build -t mariadb .
	docker run --name mariadb -v ${PWD}/../../../data/mariadb:/var/lib/mysql -d mariadb
fclean:
	rm -rf ${PWD}/../../../data/mariadb
	docker rm -f mariadb
	docker rmi mariadb

re:			fclean all

.PHONY:		all fclean re
