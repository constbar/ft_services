FROM alpine:3.12
MAINTAINER agroup

RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add supervisor vim
RUN apk add php7-session php7-gd
RUN apk add php7-fpm php7-opcache
RUN apk add php7-mysqli php7-iconv
RUN apk add php7-mbstring php7-json 
RUN apk add php7-zlib php7-curl php7

COPY ./ /
RUN mkdir -p /var/www/
RUN mkdir -p /run/nginx
RUN mv supervisord.conf /etc/supervisord.conf
RUN mv nginx.conf /etc/nginx/conf.d/default.conf
RUN tar -xzvf phpMyAdmin-5.0.2-english.tar.gz
RUN mv phpMyAdmin-5.0.2-english /var/www/phpmyadmin
RUN mv config.inc.php /var/www/phpmyadmin
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 5000