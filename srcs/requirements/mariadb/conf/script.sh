#!/bin/bash

# Lire les informations de login/password à partir du fichier .env
source .env

# Attendre que le serveur MariaDB soit démarré
until mysqladmin ping -h localhost --silent; do
    sleep 1
done

# Création de la base de données pour WordPress
mysql -h localhost -u "$DB_USERNAME" -p"$DB_PASSWORD" <<EOF
CREATE DATABASE wordpress;
CREATE USER '$DB_USERNAME'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO '$DB_USERNAME'@'localhost';
FLUSH PRIVILEGES;
EOF

# Redémarrage du serveur MariaDB
service mysql restart