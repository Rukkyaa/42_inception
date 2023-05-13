# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rukkyaa <rukkyaa@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/25 17:39:14 by jcluzet           #+#    #+#              #
#    Updated: 2023/05/13 17:31:53 by rukkyaa          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

#start my sql service
service mysql start;

# create a database (if the database does not exist)
mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"

# create an user with a password (if the user does not exist)
mysql -e "CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'admin';"

# give all privileges to the user
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%' IDENTIFIED BY 'admin';"

# add another user
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';"

#reload the database
mysql -e "FLUSH PRIVILEGES;"

#shutdown
mysqladmin -u root -proot shutdown

#use exec to 
exec mysqld_safe
