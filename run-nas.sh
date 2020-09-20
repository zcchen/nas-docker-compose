#!/usr/bin/env sh

DOCKER_COMPOSEFILE_WILDCARD="docker-compose*.yml"
DOCKER_COMPOSEFILE_ARGS=$(ls -1 ${DOCKER_COMPOSEFILE_WILDCARD}| sed -e 's:^:-f &:g')

if [ -z $1 ]; then
    echo "Usage: $0 <command>"
    echo "  command are same as the command of docker-compose."
    echo "  common commands are <up|down|help>."
    exit 1
fi

echo "COMPOSEFILES: ${DOCKER_COMPOSEFILE_ARGS}"
docker-compose ${DOCKER_COMPOSEFILE_ARGS} $@

