#!/bin/sh
openssl pkcs12 -inkey privkey.pem -chain  -out server.p12 -CAfile ../serverCA/certChain.pem -descert -export -in server.pem
