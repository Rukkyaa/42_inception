# Let's start from the debian image
FROM debian:buster

# Install MariaDB client & server
RUN	apt-get update
RUN	apt-get install -y mariadb-client
RUN	apt-get install -y mariadb-server

# Expose the 3306 port
EXPOSE 3306

# Copy the script to the container
COPY ./conf/script.sh /docker-entrypoint-initdb.d/script.sh

# Add execute permission to the script
RUN chmod +x /docker-entrypoint-initdb.d/script.sh

# Start the MariaDB server
CMD ["mysqld"]
