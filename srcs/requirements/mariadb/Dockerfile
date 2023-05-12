# Let's start from the debian image
FROM	debian:buster

# Install maria db client & server
RUN	apt-get update
RUN	apt-get install -y mariadb-client
RUN	apt-get install -y mariadb-server

# Expose the 3306 port
EXPOSE 3306

# Copy the .sh file to the inception folder
COPY ./conf/script.sh ~/Documents/42_inception/