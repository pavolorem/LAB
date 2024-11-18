#!/bin/bash
## input file for list of nodes ##
servers=$(cat rke2_nodes.txt)
## copy ca cert on nodes ##
for u in $servers
do
   scp ca.crt ansible@"$u":/home/ansible/
done
