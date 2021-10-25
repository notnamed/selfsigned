#!/bin/sh

ROOT=..
rm -Rf $ROOT/rootCA $ROOT/serverCA $ROOT/userCA

mkdir $ROOT/rootCA
mkdir $ROOT/rootCA/crls
mkdir $ROOT/rootCA/certs
mkdir $ROOT/rootCA/newcerts
mkdir $ROOT/rootCA/private
touch $ROOT/rootCA/index.txt
echo '100001' > $ROOT/rootCA/serial
