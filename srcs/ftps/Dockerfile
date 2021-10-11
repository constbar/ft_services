FROM alpine:3.12
MAINTAINER agroup

RUN apk update
RUN apk upgrade
RUN apk add vsftpd
RUN apk add openssl

COPY ./ /
RUN openssl req -x509 -new -newkey rsa:2048 -nodes \
    -keyout /etc/ssl/private/privkey.key -out /etc/ssl/certs/cert.crt \
	-subj "/C=RU/ST=Ivanovskaya/L=Ivanovo/O=ecole42/OU=school21/CN=agroup"

RUN mv vsftpd.conf /etc/vsftpd/
RUN chmod +x /etc/vsftpd/vsftpd.conf
RUN mkdir -p /var/log/ftp
RUN touch /var/log/ftp/xferlog
WORKDIR /

ENTRYPOINT adduser -D admin && echo "admin:admin" | chpasswd && vsftpd /etc/vsftpd/vsftpd.conf

EXPOSE 21
EXPOSE 21100