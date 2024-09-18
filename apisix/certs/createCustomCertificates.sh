#!/bin/bash

################### CA-Stuff ####################
# Create key for private CA
openssl genrsa -out ca.key 4096

# Create CA certificate
openssl req -x509 -new -key ca.key -sha256 -days 1024 -out ca.crt -config openssl_ca.cnf


#################### etcd-Stuff ####################
# Create private key
openssl genrsa -out etcd.key 4096

# Create CSR
openssl req -new -key etcd.key -out etcd.csr -config openssl_etcd.cnf

# Create signed server certificate
openssl x509 -req -in etcd.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out etcd_server.crt -days 364 -sha256
rm etcd.csr
cat etcd_server.crt ca.crt > etcd.crt


#################### apisix-Stuff ####################
# Create private key
openssl genrsa -out client.key 4096

# Create CSR
openssl req -new -key client.key -out client.csr -config openssl_client.cnf

# Create signed server certificate
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 364 -sha256
rm client.csr