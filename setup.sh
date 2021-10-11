#!/bin/bash

minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable dashboard
minikube addons enable metallb

echo -e "\e[32mmetallb\e[0m"
kubectl apply -f srcs/yamls/metallb_conf.yaml

echo -e "\e[32mdockerfiles\e[0m"
docker build -t ftps_img srcs/ftps
docker build -t mysql_img srcs/mysql
docker build -t nginx_img srcs/nginx
docker build -t wp_img srcs/wordpress
docker build -t grafana_img srcs/grafana
docker build -t influxdb_img srcs/influxdb
docker build -t phpmyadmin_img srcs/phpmyadmin

echo -e "\e[32mwp\e[0m"
kubectl apply -f srcs/yamls/wp_svc.yaml
kubectl apply -f srcs/yamls/wp_dpl.yaml
echo -e "\e[32mftps\e[0m"
kubectl apply -f srcs/yamls/ftps_svc.yaml
kubectl apply -f srcs/yamls/ftps_dpl.yaml
echo -e "\e[32mnginx\e[0m"
kubectl apply -f srcs/yamls/nginx_svc.yaml
kubectl apply -f srcs/yamls/nginx_dpl.yaml
echo -e "\e[32mmysql\e[0m"
kubectl apply -f srcs/yamls/mysql_svc.yaml
kubectl apply -f srcs/yamls/mysql_dpl.yaml
echo -e "\e[32mphpadm\e[0m"
kubectl apply -f srcs/yamls/phpadm_svc.yaml
kubectl apply -f srcs/yamls/phpadm_dpl.yaml
echo -e "\e[32mgragana\e[0m"
kubectl apply -f srcs/yamls/grafana_svc.yaml
kubectl apply -f srcs/yamls/grafana_dpl.yaml
echo -e "\e[32minfluxdb\e[0m"
kubectl apply -f srcs/yamls/influxdb_svc.yaml
kubectl apply -f srcs/yamls/influxdb_dpl.yaml

minikube dashboard

# kill proc
# kubectl exec deploy/ftps -- pkill vsftpd
# kubectl exec deploy/grafana -- pkill grafana
# kubectl exec deploy/influx -- pkill influxdb
# kubectl exec deploy/wordpress -- pkill nginx
# kubectl exec deploy/wordpress -- pkill php-fpm7
# kubectl exec deploy/phpmyadmin -- pkill nginx
# kubectl exec deploy/phpmyadmin -- pkill php-fpm7
# kubectl exec deploy/nginx -- pkill nginx
# kubectl delete pod --all