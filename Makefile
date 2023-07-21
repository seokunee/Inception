# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seokchoi <seokchoi@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/29 15:19:36 by seokchoi          #+#    #+#              #
#    Updated: 2023/07/17 17:36:02 by seokchoi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NGINX_DIR = ./srcs/requirements/nginx
MARIADB_DIR = ./srcs/requirements/mariadb
WORDPRESS_DIR = ./srcs/requirements/wordpress

all:		
			docker-compose up -d
# docker build -f Dockerfile -f nginx_image ${NGINX_DIR}
# docker build -f Dockerfile -f mariadb_image ${MARIADB_DIR}
# docker build -f Dockerfile -f wordpress_image ${WORDPRESS_DIR}

clean:
			rm -f ${OBJS}

fclean:		clean
			rm -f ${NAME}

re:			fclean all

.PHONY:		all clean fclean re
