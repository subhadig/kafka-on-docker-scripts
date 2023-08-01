#!/bin/sh

echo "Stoping kafka.."
docker stop kafka

echo "Stoping zookeeper.."
docker stop zookeeper

echo "Stopping network kafka-net"
docker network rm kafka-net
