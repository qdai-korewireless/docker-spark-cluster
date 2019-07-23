
#build images
./env/build-images.sh

#create a network if not exist
docker network ls|grep bling-network > /dev/null || docker network create bling-network --driver=bridge --subnet=10.5.0.0/16

#launch everything
docker-compose -f ./env/backend.yml up -d 
docker-compose -f ./env/api.yml up -d 
docker-compose -f ./env/spark.yml up -d 

echo "Spark Cluster and Bling API have started up, launching browser..."
sleep 5

start http://localhost:8080
start http://localhost:37600