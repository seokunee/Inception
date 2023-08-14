# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seokchoi <seokchoi@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/29 15:19:36 by seokchoi          #+#    #+#              #
#    Updated: 2023/08/13 21:00:26 by seokchoi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NGINX_DIR = ./srcs/requirements/nginx
MARIADB_DIR = ./srcs/requirements/mariadb
WORDPRESS_DIR = ./srcs/requirements/wordpress

all:		
	docker-compose up -d --env-file /srcs/.env
# docker build -f Dockerfile -f nginx_image ${NGINX_DIR}
# docker build -f Dockerfile -f mariadb_image ${MARIADB_DIR}
# docker build -f Dockerfile -f wordpress_image ${WORDPRESS_DIR}

up:

down:

clean:
			

fclean:		clean
			

re:			fclean all

.PHONY:		all clean fclean re
