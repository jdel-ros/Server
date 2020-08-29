# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Dockerfile                                       .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: jdel-ros <jdel-ros@student.le-101.fr>      +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2020/01/16 14:16:09 by jdel-ros     #+#   ##    ##    #+#        #
#    Updated: 2020/01/17 09:43:58 by jdel-ros    ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update \
	&& apt-get install -y \
		nginx \
		wget \
		default-mysql-server \
		default-mysql-client \
		php \
		php-fpm \
		php-gd \
		php-mysql \
		php-cli \
		php-curl \
		php-mbstring \
		openssl

COPY srcs/text/ /var/www/html

RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz \
	&& tar -zxvf latest-fr_FR.tar.gz \
	&& mv wordpress ./var/www/html/wordpress/ \
	&& rm latest-fr_FR.tar.gz\
	&& wget https://files.phpmyadmin.net/phpMyAdmin/5.0.0/phpMyAdmin-5.0.0-all-languages.tar.gz \
	&& tar -zxvf phpMyAdmin-5.0.0-all-languages.tar.gz \
	&& mv phpMyAdmin-5.0.0-all-languages ./var/www/html/phpMyAdmin \
	&& rm phpMyAdmin-5.0.0-all-languages.tar.gz \
	&& chmod -R 755 /var/www/*

EXPOSE 80 443 3306

CMD service nginx start \
		service php7.3-fpm start \
		service mysql start \
		sleep infinity & wait
