#!/bin/sh
echo "Creating Server Certificate"
openssl req -config ./openssl.cnf -addext "subjectAltName = DNS:$sandnsname" -new -days 3650 -subj "/C=$countrycode/O=$organization/OU=$orgunit/CN=$sandnsname" -keyout ../privkey.pem -out ../server.csr
openssl ca -config ./openssl.cnf -name CA_ROOT -in ../server.csr -out server.pem
openssl x509 -in server.pem -outform pem -out ../server.pem
openssl rsa -in ../privkey.pem -out ../unencryptedkey.pem
rm ../server.csr
echo "Done"


echo  "#####################################################"
echo  "Private Key: privkey.pem"
echo  "Certificate: server.pem"
echo  "Unencrypted Private Key: unencryptedkey.pem"
echo  "#####################################################"

