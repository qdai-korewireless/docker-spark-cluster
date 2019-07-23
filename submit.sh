#!/bin/bash
docker build -t spark-submit ./docker/spark-submit

docker run --network docker-spark_spark-network -v d:/dev/Local-Dockers/docker-spark/env/bling_eng_jar:/tmp/spark-apps spark-submit