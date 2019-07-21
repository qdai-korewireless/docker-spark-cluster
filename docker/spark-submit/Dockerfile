FROM spark-base:2.4.3

COPY spark-submit.sh /
COPY config.txt /

ENV SPARK_MASTER_URL="spark://spark-master:7077"
ENV SPARK_SUBMIT_ARGS=""
ENV SPARK_APPLICATION_ARGS ""
ENV SPARK_APPLICATION_JAR_LOCATION="/opt/spark-apps/services-worker-1.0-SNAPSHOT.jar"
ENV SPARK_APPLICATION_MAIN_CLASS="com.kore.bling.engine.services.worker.App"



CMD ["/bin/bash", "/spark-submit.sh"]
