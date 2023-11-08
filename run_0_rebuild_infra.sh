docker stop ambient-infa-container
docker stop $(docker ps -a -q --filter ancestor=ambient-infra-image)
docker rm $(docker ps -a -q --filter ancestor=ambient-infra-image)
docker rmi ambient-infra-image
docker build -t ambient-infra-image deployment_docker/.