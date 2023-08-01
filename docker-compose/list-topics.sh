#!/usr/bin/env sh

docker run -it --rm \
    --network docker-compose_default \
    confluentinc/cp-kafkacat \
    kafkacat -b kafka:19092 \
    -L -J | python3 -m json.tool
