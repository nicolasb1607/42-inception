#! /bin/sh



# MYSQL_ROOT_PASSWORD="secret"
# DB_PASSWORD="inceptiontest123"
# DB_USER="nburatd"
# DB_NAME="wpdb"
# DB_HOST="nburat-d.42.fr"


sleep 10 

wp config create --allow-root \
	--dbname=$DB_NAME \
	--dbuser=$DB_USER \
	--dbpass=$DB_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/html/wordpress/'

mkdir -p /run/php/php7.3

php-fpm7.3 -F