#!/bin/sh
echo "Creating Server Certificate"
openssl req -config ./openssl.cnf -extensions ocsp_cert -new -days 3650 -keyout privkey.pem -out server.csr
openssl ca -config ./openssl.cnf -extensions ocsp_cert -name CA_server -in server.csr -out server.pem
openssl rsa -in privkey.pem -out unencryptedkey.pem
rm server.csr
echo "Done"


echo  "#####################################################"
echo  "Private Key: privkey.pem"
echo  "Certificate: server.pem"
echo  "Unencrypted Private Key: unencryptedkey.pem"
echo  "#####################################################"

