all : 
	mkdir -p ${PWD}/../../../data/wordpress
	docker build -t wordpress .
	docker run --name wordpress -p 9000:9000 -it -v ${PWD}/../../../data/wordpress:/var/www/html -d wordpress

fclean:
	-rm -rf ${PWD}/../../../data
	-docker rm -f wordpress
	-docker rmi wordpress

re:
	make fclean 
	make all

.PHONY:		all clean fclean re
