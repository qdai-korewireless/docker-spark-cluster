#!/bin/bash

set -e

docker build -t spark-base ./docker/base
docker build -t spark-master ./docker/spark-master
docker build -t spark-worker ./docker/spark-worker
docker build -t spark-submit ./docker/spark-submit