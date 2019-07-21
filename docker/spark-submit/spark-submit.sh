 #!/bin/bash
 
 #encode overiding config to base64 and pass to application argument -config
 SPARK_APPLICATION_ARGS=$(/bin/base64 /config.txt)
 
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
