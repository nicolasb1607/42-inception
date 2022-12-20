FROM debian:buster

EXPOSE 443
EXPOSE 8080
#Install Nginx and create "www" group
RUN apt-get update
RUN apt-get install nginx -y

RUN adduser www
RUN mkdir -p /var/www/html/
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /var/www/html/
RUN chmod 755 /var/www/html
COPY ./index.html /var/www/html/

#Setup TLS certificate autosigned with OpenSSL
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=nburat-d.42.fr/UID=nburat-d"

#Copy the nginx configuration file
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

#RUN nginx -t

CMD [ "nginx", "-g", "daemon off;" ]