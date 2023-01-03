FROM debian:buster

RUN apt-get update 
RUN apt-get install mariadb-server mariadb-client -y

RUN mkdir -p /var/run/mysqld
RUN chmod -R 777 /var/run/mysqld/

RUN chmod -R 777 /var/lib/mysql/

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/init.sh /var/bin/
RUN chmod 644 /var/bin/init.sh

EXPOSE 3306


ENTRYPOINT [ "sh", "/var/bin/init.sh" ]


