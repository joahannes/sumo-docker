docker stop $(docker ps --filter status=running -q)
docker rm $(docker ps --filter status=exited -q)

docker rmi -f $(docker images -aq)