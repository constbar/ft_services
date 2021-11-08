FROM alpine:3.12
MAINTAINER constbar

RUN apk update
RUN apk upgrade vim
RUN apk add influxdb
RUN apk add supervisor
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY ./ /
RUN mv supervisord.conf /etc/supervisord.conf
RUN mkdir -p /etc/telegraf/
RUN ./usr/bin/telegraf -sample-config --input-filter docker \
--output-filter influxdb > /etc/telegraf/telegraf.conf
WORKDIR /
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 8086
