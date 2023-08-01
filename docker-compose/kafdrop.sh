#/usr/bin/env sh

docker run \
    -it \
    --rm -p 19000:9000 \
    --name kafdrop \
    --network docker-compose_default \
    -e KAFKA_BROKERCONNECT=kafka:19092 \
    -e JVM_OPTS="-Xms32M -Xmx64M" \
    -e SERVER_SERVLET_CONTEXTPATH="/" \
    obsidiandynamics/kafdrop
