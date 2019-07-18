 #!/bin/bash
 
/spark/bin/spark-submit \
--class ${SPARK_APPLICATION_MAIN_CLASS} \
--master ${SPARK_MASTER_URL} \
--deploy-mode cluster \
--total-executor-cores 4 \
--packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.3 \
 ${SPARK_SUBMIT_ARGS} \
 ${SPARK_APPLICATION_JAR_LOCATION} \
 ${SPARK_APPLICATION_ARGS} \
