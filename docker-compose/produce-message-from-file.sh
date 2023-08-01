#!/usr/bin/env sh

message=`cat "$2"`

docker run --interactive --rm \
    --network docker-compose_default \
    confluentinc/cp-kafkacat \
    kafkacat -b kafka:19092 \
    -t "$1" \
    -P <<EOF
$message
EOF
