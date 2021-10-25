#!/bin/bash
echo "What FQDN are we making a certificate for?"
read sandnsname
echo $sandnsname > sandnsname
sed -i "s/changeme.internal/$sandnsname/g" ./bin/openssl.cnf
echo "Initializing..."
cd ./bin
./init.sh
echo "Making CA tree..."
./makeCATree.sh
echo "Making a server cert..."
./makeServerCert.sh
echo "Putting the root CA in a useful place"
cp /usr/src/rootCA/cert.pem /usr/src/root.pem
echo "Verifying the new cert"
openssl verify -CAfile /usr/src/root.pem /usr/src/server.pem
echo "Done!"
