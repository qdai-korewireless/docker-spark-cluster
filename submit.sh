#!/bin/bash
v=$1
if [ -z "$v" ];
then
  echo "version number is required (e.g. 1.1.111)"
  sleep 5
  exit
fi

#import all env variables
for var in `cat .env`
do
   eval $var
done

#build image
docker build -t spark-submit ./docker/spark-submit

#run spark submit container
docker run --network ${NETWORK_NAME} -v ${BLING_ENG_LOCAL_JAR}:/tmp/spark-apps -e JAR_VERSION=$v spark-submit 

