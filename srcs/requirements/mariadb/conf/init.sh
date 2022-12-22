#!/bin/sh


service mysql start

while !(mysqladmin ping > /dev/null)
do
	sleep 5
	echo "\n\e[5m Waiting for Mariadb... \e[25m\n"
done

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -e "DROP USER $DB_ADMIN@'%';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "CREATE USER $DB_ADMIN@'%' IDENTIFIED BY '$DB_ADMIN_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO $DB_ADMIN@'%' IDENTIFIED BY '$DB_ADMIN_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

mysql -e "DROP USER $DB_USER@'%';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "CREATE USER $DB_USER@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -uroot -pSomePass shutdown 

exec mysqld