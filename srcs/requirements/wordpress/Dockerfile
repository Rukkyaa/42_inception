# Let's start from the debian image
FROM	debian:buster

# Install all the requirements for wordpress
RUN	apt-get update
RUN	apt-get install -y wget\
	php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

# Config
COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Create a run file to stock the temporary files from php
RUN	mkdir -p /run/php

# Install wp-cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp

# Copy the script to start the services
COPY	conf/wordpress.sh ./
RUN		chmod +x wordpress.sh

# Expose the port 9000
EXPOSE	9000

CMD	["bash", "wordpress.sh"]