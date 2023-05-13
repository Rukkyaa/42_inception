# Let's start from the debian image
FROM	debian:buster

# Install mariadb-server
RUN	apt-get update
RUN	apt-get install -y mariadb-server

# Copy the bash script to create the database and the user
COPY	conf/script.sh /script.sh

# Execute the bash script
ENTRYPOINT	["bash", "script.sh"]

# Choose the port to listen
EXPOSE	3306

# Launch the mariadb server
CMD	["mysqld", "--bind-address=0.0.0.0"]
