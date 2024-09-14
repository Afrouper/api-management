#!/bin/sh

openssl req -new -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout apisix-cluster.key -out apisix-cluster.crt -subj "/CN=apisix_cluster"