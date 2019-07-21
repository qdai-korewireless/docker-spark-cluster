
#launch everything
docker-compose -f ./env/backend.yml down
docker-compose -f ./env/api.yml down
docker-compose -f ./env/spark.yml down