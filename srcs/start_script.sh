# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    start_script.sh                                  .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: jdel-ros <jdel-ros@student.le-101.fr>      +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2020/01/18 14:03:46 by jdel-ros     #+#   ##    ##    #+#        #
#    Updated: 2020/01/18 16:23:43 by jdel-ros    ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

#!/bin/sh

service nginx start;
service php7.3-fpm start;
service mysql start;

mysql < user.sql;

nginx -g "daemon off;";
service mysql restart;
sleep infinity & wait;
