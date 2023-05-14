# Let's start from the debian image
FROM debian:buster

# Install mariadb
RUN apt-get update && apt-get install -y mariadb-server mariadb-client

ARG DB_ADMIN_PASSWORD
ARG DB_USERNAME
ARG DB_PASSWORD

RUN service mysql start && mysqladmin -u root password ${DB_ADMIN_PASSWORD}
RUN service mysql start \
    && mysql -uroot -p${DB_ADMIN_PASSWORD} -e "CREATE DATABASE wordpress; \
    CREATE USER '${DB_USERNAME}'@'%' IDENTIFIED BY '${DB_PASSWORD}'; \
    GRANT ALL ON wordpress.* TO '${DB_USERNAME}'@'%'; \
    FLUSH PRIVILEGES;"

RUN service mysql restart
# Choose the port to listen
EXPOSE 3306

# Start mariadb
CMD ["mysqld", "--bind-address=0.0.0.0"]