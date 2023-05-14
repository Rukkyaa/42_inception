#!bin/bash
sleep 10
if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp config create	--allow-root --dbname=$DB_NAME --dbuser=$DB_USERNAME --dbpass=$DB_PASSWORD \
    					--dbhost=mariadb:3306 --path='/var/www/wordpress'

sleep 2
wp core install     --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USERNAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_MAIL --allow-root --path='/var/www/wordpress'
wp user create      --allow-root --role=author $WP_USER_USERNAME $WP_USER_MAIL --user_pass=$WP_USER_PASSWORD --path='/var/www/wordpress' >> /log.txt
fi

/usr/sbin/php-fpm7.3 -F