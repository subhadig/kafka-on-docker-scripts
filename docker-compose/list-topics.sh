#!/usr/bin/env sh

docker run -it \
    --network docker-compose_default \
    confluentinc/cp-kafkacat \
    kafkacat -b kafka:19092 \
    -L
