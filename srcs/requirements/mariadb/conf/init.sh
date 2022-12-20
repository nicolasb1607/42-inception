#!/bin/sh


service mysql start


mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -e "CREATE USER $DB_USER@localhost IDENTIFIED BY $DB_PASSWORD;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO $DB_USER@localhost IDENTIFIED BY $DB_PASSWORD;"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -uroot -pSomePass shutdown 

exec mysqld