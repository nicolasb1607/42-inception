FROM debian:buster

RUN apt-get update
RUN apt-get install php7.3 php7.3-fpm php7.3-cli php-mysql mariadb-client curl -y


RUN apt-get install wget -y

RUN mkdir -p /var/www/html/wordpress/

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chown -R www-data:www-data /etc/php/7.3/fpm/pool.d/www.conf


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN wp --info
RUN php -v

COPY ./conf/auto_config.sh /bin/
RUN chmod 777 /bin/auto_config.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "/bin/auto_config.sh" ]