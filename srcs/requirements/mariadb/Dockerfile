FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

RUN service mysql start && mysqladmin -u root password ${DB_ADMIN_PASSWORD}

RUN service mysql start \
    && mysql -uroot -p${DB_ADMIN_PASSWORD} -e "CREATE DATABASE wordpress; \
    CREATE USER '${DB_USERNAME}'@'%' IDENTIFIED BY '${DB_PASSWORD}'; \
    GRANT ALL ON wordpress.* TO '${DB_USERNAME}'@'%'; \
    FLUSH PRIVILEGES;"

EXPOSE 3306

CMD ["mysqld", "--bind-address=0.0.0.0"]