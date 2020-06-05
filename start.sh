#!/bin/sh

echo "Creating network kafka-net.."
docker network create kafka-net

echo "Starting zookeeper.."
docker run -d --rm --network kafka-net -p 2181:2181 --name zookeeper -e ALLOW_ANONYMOUS_LOGIN=yes bitnami/zookeeper:latest

echo "Starting kafka broker.."
docker run -d --rm --network kafka-net -p 9092:9092 -p 29092:29092 --name kafka \
                                                               -e ALLOW_PLAINTEXT_LISTENER=yes \
                                                               -e KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper:2181 \
                                                               -e KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP=INTERNAL:PLAINTEXT,EXTERNAL:PLAINTEXT \
                                                               -e KAFKA_CFG_LISTENERS=INTERNAL://:9092,EXTERNAL://:29092 \
                                                               -e KAFKA_CFG_ADVERTISED_LISTENERS=INTERNAL://kafka:9092,EXTERNAL://localhost:29092 \
                                                               -e KAFKA_CFG_INTER_BROKER_LISTENER_NAME=INTERNAL \
                                                               bitnami/kafka:2.5.0

echo "Printing all running docker containers.."
docker ps
