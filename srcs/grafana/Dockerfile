FROM alpine:3.12
MAINTAINER agroup

RUN apk update
RUN apk upgrade vim
RUN apk add libc6-compat

COPY ./ /
RUN tar -zxvf grafana-7.3.6.linux-amd64.tar.gz
RUN mv grafana-7.3.6 grafana
COPY grafana.db /grafana/data/grafana.db
WORKDIR /
ENTRYPOINT cd /grafana/bin && ./grafana-server

EXPOSE 3000