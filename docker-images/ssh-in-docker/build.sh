#!/bin/bash

ARG=$1

source ../../config

if [ "$ARG" = "local" ]
then
    mkdir ../../tmp
    cp -R ../ ../../tmp
    mv ../../tmp ./tmp
fi

DOCKER_BUILDKIT=1 docker build \
    --ssh default=${SSH_AUTH_SOCK} \
    --build-arg DOCKER_REGISTRY="${DOCKER_REGISTRY}" \
    -t ${IMAGE_WITH_TAG} .
    # --build-arg SSH_PRIVATE_KEY="${cat ~/.ssh/id_rsa}" \

if [ "$ARG" = "push" ]
then
    push_image_to_registry
fi

if [ "$ARG" = "local" ]
then
    rm -rf ./tmp
fi

