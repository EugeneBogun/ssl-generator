#!/usr/bin/env bash

DIRECTORY=`dirname $0`
ROOT_KEY_FILE=$DIRECTORY/root-certificate/root.key
ROOT_PEM_FILE=$DIRECTORY/root-certificate/root.pem

if ! [ -f "$ROOT_KEY_FILE" ]
then
    echo "$ROOT_KEY_FILE not found";
    sh $DIRECTORY/root-generator.sh
fi

if ! [ -f "$ROOT_PEM_FILE" ]
then
    echo "$ROOT_PEM_FILE not found";
    sh $DIRECTORY/root-generator.sh
fi

sh $DIRECTORY/certificate-generator.sh $1


