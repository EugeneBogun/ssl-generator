#!/usr/bin/env bash

if [ -z "$1" ]
then
  echo "Please supply a subdomain to create a certificate for";
  echo "e.g. mysite.localhost"
  exit;
fi

DOMAIN=$1
COMMON_NAME=${2:-$1}
SUBJECT="/C=CA/ST=None/L=NB/O=None/CN=$COMMON_NAME"
NUM_OF_DAYS=999
DIRECTORY=`dirname $0`
KEY_DIRECTORY=$DIRECTORY/certificates/$DOMAIN
ROOT_KEY_DIRECTORY=$DIRECTORY/root-certificate

rm -rf $KEY_DIRECTORY
mkdir $KEY_DIRECTORY

if [ -f $KEY_DIRECTORY/device.key ]
then
  KEY_OPT="-key"
else
  KEY_OPT="-keyout"
fi

openssl req -new -newkey rsa:2048 -sha256 -nodes $KEY_OPT $KEY_DIRECTORY/device.key -subj "$SUBJECT" -out $KEY_DIRECTORY/device.csr

cat $DIRECTORY/certificates/v3.ext | sed s/%%DOMAIN%%/$COMMON_NAME/g > /tmp/$DOMAIN__v3.ext

openssl x509 -req -in $KEY_DIRECTORY/device.csr -CA $ROOT_KEY_DIRECTORY/root.pem -CAkey $ROOT_KEY_DIRECTORY/root.key -CAcreateserial -out $KEY_DIRECTORY/device.crt -days $NUM_OF_DAYS -sha256 -extfile /tmp/$DOMAIN__v3.ext
