#! /bin/sh

sleep 10

mkdir -p /run/php/php7.3

exec php-fpm7.3 -F