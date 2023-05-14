#!/bin/bash

# Check if WordPress is already installed
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then

	# Download WordPress
	wget https://fr.wordpress.org/wordpress-6.2-fr_FR.tar.gz -P /var/www/html/ && \
	cd /var/www/html && tar -xvf wordpress-6.2-fr_FR.tar.gz && rm wordpress-6.2-fr_FR.tar.gz && \
	chown -R root:root /var/www/html/wordpress
    
	# Create the wp-config.php file
	wp config create --allow-root --dbname="$DB_NAME" --dbuser="$DB_USERNAME" --dbpass="$DB_PASSWORD" \
        --dbhost="mariadb:3306" --path="/var/www/html/wordpress"

    # Installer WordPress
	wp core install --allow-root --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USERNAME" \
		--admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_MAIL" --path="/var/www/html/wordpress"
fi

# Démarrer le serveur php-fpm
/usr/sbin/php-fpm7.3 -F