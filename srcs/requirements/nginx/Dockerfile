# Let's start from the debian image
FROM	debian:buster

# Install nginx & openssl
RUN	apt-get update
RUN	apt-get install -y nginx
RUN	apt-get install -y openssl

# SSL Part
RUN	mkdir /etc/nginx/ssl
RUN	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/axlamber.crt \
       -keyout /etc/nginx/ssl/axlamber.key \
       -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=axlamber/CN=axlamber/"

# Config
COPY	./conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY	index.html /var/www/html/


# Create a run file to stock the temporary files from nginx
RUN	mkdir -p /run/nginx

# Choose the port to listen
EXPOSE	443

# Start nginx (daemon off to keep the nginx alive while the container is running)
CMD	["nginx", "-g", "daemon off;"]