#!/bin/sh

openssl ca -config ./openssl.cnf  -gencrl -crldays 768 -md sha1 -name CA_default > rootCA.crl
openssl crl -in rootCA.crl -inform pem -outform der -out rootCA.crl 
openssl ca -config ./openssl.cnf  -gencrl -crldays 768 -md sha1 -name CA_server > serverCA.crl
openssl crl -in serverCA.crl -inform pem -out serverCA.crl -outform der
openssl ca -config ./openssl.cnf  -gencrl -crldays 768 -md sha1 -name CA_user > userCA.crl
openssl crl -in userCA.crl -inform pem -out userCA.crl -outform der

