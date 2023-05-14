#!/bin/sh

#start my sql service
service mysql start;

# Create the database if it does not exist
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# Create the user with a password if the user does not exist
mysql -e "CREATE USER IF NOT EXISTS '$DB_USERNAME'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"

# Grant all privileges to the user
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD';"

# Modify the root user's password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ADMIN_PASSWORD';"

# Reload privileges
mysql -e "FLUSH PRIVILEGES;"

# Shutdown MySQL
mysqladmin -u root -p"$DB_ADMIN_PASSWORD" shutdown

# Start MySQL in safe mode
exec mysqld_safe
