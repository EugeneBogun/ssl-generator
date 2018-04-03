#!/usr/bin/env bash
DIRECTORY=`dirname $0`

openssl genrsa -out $DIRECTORY/root.key 2048
openssl req -x509 -new -nodes -key $DIRECTORY/root.key -sha256 -days 1024 -out $DIRECTORY/root.pem
