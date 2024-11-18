#!/bin/bash

## generate key
openssl genrsa -out master1.key && \

## generate csr
openssl req \
    -newkey rsa:4096 \
    -keyout /etc/pki/tls/master1.key \
    -out /etc/pki/tls/master1.csr \
    -subj "/CN=master1.rke2.internal/O=RKE2/OU=RKE2/C=SK/L=Bratislava"
