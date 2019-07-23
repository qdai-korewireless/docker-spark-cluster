#!/bin/bash
JAR_VERSION=1.1.111
if [ ! -f /tmp/spark-apps/services-worker-${JAR_VERSION}.jar ]; then
  echo "downloading Bling Engine Jar file version: ${JAR_VERSION}..."
  wget --no-verbose --no-check-certificate "https://artifactory.ksg.int:4443//list/libs-release-local/com/kore/bling/engine/services/services-worker/${JAR_VERSION}/services-worker-${JAR_VERSION}.jar" -q --show-progress --progress=bar:force 2>&1
  echo "download completed!"
  mv /services-worker-${JAR_VERSION}.jar /tmp/spark-apps/services-worker-${JAR_VERSION}.jar
else
   echo "Jar file already exists for version: "${JAR_VERSION}
fi

#encode overiding config to base64 and pass to application argument -config
SPARK_APPLICATION_ARGS=$(/bin/base64 /config.txt)
SPARK_APPLICATION_JAR_LOCATION="/opt/spark-apps/services-worker-"${JAR_VERSION}".jar"

echo "jar location: "${SPARK_APPLICATION_JAR_LOCATION}


#replace argument space with empty string, otherwise the spark submitting will fail
SPARK_APPLICATION_ARGS=$(echo $SPARK_APPLICATION_ARGS | sed -e "s/ //g")
echo ${SPARK_APPLICATION_ARGS}
/spark/bin/spark-submit \
--class ${SPARK_APPLICATION_MAIN_CLASS} \
--master ${SPARK_MASTER_URL} \
--deploy-mode cluster \
--total-executor-cores 4 \
--packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.3 \
 ${SPARK_SUBMIT_ARGS} \
 ${SPARK_APPLICATION_JAR_LOCATION} \
 -config ${SPARK_APPLICATION_ARGS} \
