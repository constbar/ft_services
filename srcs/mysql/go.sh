#!/bin/sh

rc update
rc default
rc-service mariadb setup
rc-service mariadb start
mysql --execute="CREATE DATABASE WordPress_db;"
mysql --execute="GRANT ALL PRIVILEGES ON WordPress_db.* TO 'admin'@'%' IDENTIFIED BY 'admin';"
mysql --execute="FLUSH PRIVILEGES;"
mysql -uroot WordPress_db < wp.sql
rc-service mariadb stop
exec /usr/bin/mysqld_safe