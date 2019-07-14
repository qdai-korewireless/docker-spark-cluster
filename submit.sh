 #!/bin/bash
 docker run --network docker-spark_spark-network -v d:/repository/com/quan/sparkApp/1.0-SNAPSHOT:/opt/spark-apps spark-submit:2.4.3
 
 docker run --network docker-spark_spark-network -v d:/repository/com/kore/bling/engine/services/services-worker/1.0-SNAPSHOT:/opt/spark-apps spark-submit