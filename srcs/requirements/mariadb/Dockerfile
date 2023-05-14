# Let's start from the debian image
FROM debian:buster

# Install mariadb
RUN apt-get update && apt-get install -y mariadb-server mariadb-client

RUN service mysql start && mysqladmin -u root password inception_admin_password
RUN service mysql start \
    && mysql -uroot -pinception_admin_password -e "CREATE DATABASE wordpress; \
    CREATE USER 'inception_user'@'%' IDENTIFIED BY 'inception_user_password'; \
    GRANT ALL ON wordpress.* TO 'inception_user'@'%'; \
    FLUSH PRIVILEGES;"

RUN service mysql restart
# Choose the port to listen
EXPOSE 3306

# Start mariadb
CMD ["mysqld", "--bind-address=0.0.0.0"]