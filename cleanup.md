# loadstress test on docker compose 
docker run -d --rm --network host busybox sh -c "while true; do wget -q -O- http://localhost:8083; sleep 0.1; done"

# Stop all containers
docker stop $(docker ps -q)
docker stop $(docker ps -q)

# Remove all containers (including stopped ones)
docker rm $(docker ps -aq)

# explain
docker ps -q (inner command)
docker ps - lists all running containers

-q (quiet) - shows only container IDs, no extra information
