#!/bin/bash
set -a
echo "What FQDN are we making a certificate for?"
read sandnsname
sed -i "s/changeme.internal/$sandnsname/g" bin/openssl.cnf
echo "Please enter a two-character country code (e.g. US)"
read countrycode
echo "Please enter your company name"
read organization
echo "Please enter an organizational unit (e.g. IT)"
read orgunit
echo "Initializing..."
cd ./bin
./init.sh
echo "Making CA tree..."
./makeCATree.sh
echo "Making a server cert..."
./makeServerCert.sh
echo "Move the files to the bind-mount"
cp /usr/src/rootCA/cert.pem /mnt/root.pem
cp /usr/src/server.pem /mnt/server.pem
cp /usr/src/unencryptedkey.pem /mnt/private.key
cat /mnt/server.pem /mnt/root.pem > /mnt/certificate.crt
echo "Verifying the new cert was issued by the root"
openssl verify -CAfile /mnt/root.pem /mnt/server.pem
echo "Verifying the new SAN DNS name"
if [ "$(openssl x509 -text -noout -in /mnt/server.pem | grep DNS | cut -d\: -f2)" == "$sandnsname" ];
then echo "OK!"
else echo "SAN does not seem to match, please check manually"
fi
echo "Done!"
