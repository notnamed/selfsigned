#!/bin/sh
echo -n "Creating self signed root certificate authority"
openssl req -config ./openssl.cnf -extensions v3_ca -new -x509 -days 3650 -subj "/C=$countrycode/O=$organization/OU=$orgunit/CN=$sandnsname" -keyout ../rootCA/private/privkey.pem -out ../rootCA/cert.pem
echo -n "Done"
