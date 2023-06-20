# Kafka-on-docker shell scripts

## Usage
- To start the cluster: `./start.sh`.
- To stop the cluster: `./stop.sh`.

### Connecting clients

#### Internal to docker network
- Producer that reads from `stdin`:
`docker run -it --network kafka-net edenhill/kafkacat:1.5.0 -b kafka:9092 -t test-topic -P`
- Consumer that writes to `stdout`:
`docker run -it --network kafka-net edenhill/kafkacat:1.5.0 -b kafka:9092 -t test-topic -C`

#### External to docker network
- Producer that reads from `stdin`:
`docker run -it --network host edenhill/kafkacat:1.5.0 -b localhost:29092 -t test-topic -P`
- Consumer that writes to `stdout`:
`docker run -it --network host edenhill/kafkacat:1.5.0 -b localhost:29092 -t test-topic -C`

> Press `Ctrl + D` to end the producer sessions.
