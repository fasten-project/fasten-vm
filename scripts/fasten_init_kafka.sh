#!/usr/bin/env bash

source /home/fasten/scripts/kafkatopics.sh

for topic in "${topics[@]}"; do
  kafka-topics.sh --create --zookeeper localhost:2181 --topic "fasten.$topic.out"
  kafka-topics.sh --create --zookeeper localhost:2181 --topic "fasten.$topic.err"
done

