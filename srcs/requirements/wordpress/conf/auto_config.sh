#! /bin/sh

sleep 10 

wp core download --locale=en_EN --allow-root --path='/var/www/html/wordpress/'

wp config create --allow-root \
	--dbname=$DB_NAME \
	--dbuser=$DB_USER \
	--dbpass=$DB_PASSWORD \
	--dbhost="mariadb" \
	--path='/var/www/html/wordpress/'

wp core install --url=$DB_HOST \
				--title=Inception \
				--admin_user=$DB_USER \
				--admin_password=$DB_PASSWORD \
				--admin_email=$ADMIN_MAIL \
				--allow-root \
				--path='/var/www/html/wordpress/'

mkdir -p /run/php/php7.3

exec php-fpm7.3 -F