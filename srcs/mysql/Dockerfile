FROM alpine:3.12
MAINTAINER constbar

RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN apk add mariadb vim
RUN apk add mariadb-client

COPY ./ /
RUN mkdir -p /run/openrc
RUN touch /run/openrc/softlevel
COPY mariadb-server.cnf /etc/my.cnf.d
RUN chmod +x go.sh
ENTRYPOINT sh go.sh

EXPOSE 3306