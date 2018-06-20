#!/usr/bin/env bash

FOLDER=$1
ZIP_NAME=$2
S3_LOCATION=$3

docker build -t lambdazipper . --build-arg FOLDER=$FOLDER --build-arg ZIP_NAME=$ZIP_NAME
docker run lambdazipper
CONTAINER_ID=$(docker ps -alqf ancestor=lambdazipper)
docker cp $CONTAINER_ID:build_dir/$ZIP_NAME $PWD
docker rm $CONTAINER_ID

aws s3 cp $PWD/$ZIP_NAME $S3_LOCATION/$ZIP_NAME
rm $PWD/$ZIP_NAME