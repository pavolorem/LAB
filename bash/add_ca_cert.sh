#!/bin/bash
## copy and check ca.ert
cp ca.crt /etc/pki/ca-trust/source/anchors/ && \
update-ca-trust && \
openssl verify /etc/pki/ca-trust/source/anchors/ca.crt && \
trust list | egrep -i 'ca-cert'
