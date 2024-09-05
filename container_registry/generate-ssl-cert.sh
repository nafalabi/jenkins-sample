#!/bin/bash

BASEDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

openssl genpkey -algorithm RSA -out $BASEDIR/ssl-certs/privkey.pem
openssl req -x509 -nodes -days 365 -key $BASEDIR/ssl-certs/privkey.pem -out $BASEDIR/ssl-certs/fullchain.pem -config $BASEDIR/ssl-certs/openssl.cnf -extensions req_ext
