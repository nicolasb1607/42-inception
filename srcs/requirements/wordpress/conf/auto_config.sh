#! /bin/sh



# MYSQL_ROOT_PASSWORD="secret"
# DB_PASSWORD="inceptiontest123"
# DB_USER="nburatd"
# DB_NAME="wpdb"
# DB_HOST="nburat-d.42.fr"


sleep 10 


wp core download --local=nl_NL


if ! wp core is-installed; then
	wp core install --url=$DB_HOST \
					--title=Inception \
					--admin_user=$DB_USER \
					--admin_password=$DB_PASSWORD \
					--admin_email=$ADMIN_MAIL
fi

wp config create --allow-root \
	--dbname=$DB_NAME \
	--dbuser=$DB_USER \
	--dbpass=$DB_PASSWORD \
	--dbhost="mariadb" --path="/var/www/html/wordpress/"

mkdir -p /run/php/php7.3

exec php-fpm7.3 -F