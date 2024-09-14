#!/bin/sh

openssl req -new -x509 -nodes -newkey ec:<(openssl ecparam -name secp384r1) -keyout ./kong-cluster.key -out ./kong-cluster.crt -days 1095 -subj "/CN=kong_clustering"