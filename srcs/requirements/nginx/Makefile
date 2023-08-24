
all : 
	docker build -t nginx .
	docker run -it --name nginx -p 443:443 -d nginx
		
fclean:	
	docker rm -f nginx

re:			fclean all

.PHONY:		all clean fclean 
