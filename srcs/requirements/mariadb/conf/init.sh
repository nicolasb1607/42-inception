#!/bin/sh

# Start the mysqld daemon
mysqld &

# Wait for the mysqld process to start
while !(mysqladmin ping > /dev/null)
do
    sleep 5
    echo "\n\e[5m Waiting for Mariadb... \e[25m\n"
done

# Set the root password
mysql -uroot --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

# Create the database and user, if they do not already exist
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "DROP USER IF EXISTS $DB_ADMIN@'%';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE USER $DB_ADMIN@'%' IDENTIFIED BY '$DB_ADMIN_PASSWORD';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO $DB_ADMIN@'%' IDENTIFIED BY '$DB_ADMIN_PASSWORD';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "DROP USER IF EXISTS $DB_USER@'%';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE USER $DB_USER@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

# Shut down the mysql daemon
mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown

# Run the mysql daemon as the final step
exec mysqld

