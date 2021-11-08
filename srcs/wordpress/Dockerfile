FROM alpine:3.12
MAINTAINER constbar

RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add supervisor
RUN apk add php7 php7-fpm php7-opcache
RUN apk add php7-gd php7-iconv php7-mysqli
RUN apk add php7-zlib php7-curl php7-mbstring
RUN apk add php7-json php7-session vim

COPY ./ /
ADD https://wordpress.org/latest.tar.gz .
RUN mv supervisord.conf /etc/supervisord.conf
RUN mkdir -p /run/nginx
RUN mv nginx.conf /etc/nginx/conf.d/default.conf
RUN tar -xzvf latest.tar.gz
RUN mv wordpress /var/www/
RUN mv wp-config.php /var/www/wordpress/wp-config.php
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 5050