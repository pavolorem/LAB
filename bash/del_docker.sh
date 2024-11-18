## delete all containers and images
#!/bin/bash

docker container stop $(docker container ls -a -q) && \
docker container rm $(docker container ls -a -q) && \
docker container prune ; docker image rm $(docker image ls -a -q) && docker image prune
