#!/usr/bin/env bash

export VARIABLE=$(cat body.txt)
echo $VARIABLE | /usr/local/lib/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test >/dev/null
