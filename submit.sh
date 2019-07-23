#!/bin/bash
v=$1
BLING_ENG_LOCAL_JAR="c:/bling_eng_jar"

#build image
docker build -t spark-submit ./docker/spark-submit

#create directory for bling engine jar
mkdir -p ${BLING_ENG_LOCAL_JAR}

#run spark submit container
docker run --network bling-network -v ${BLING_ENG_LOCAL_JAR}:/tmp/spark-apps -e JAR_VERSION=$v spark-submit 

