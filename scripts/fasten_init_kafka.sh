#!/usr/bin/env bash

source /home/fasten/scripts/kafkatopics.sh

for topic in "${topics[@]}"; do
  kafka-topics.sh --create --zookeeper localhost:2181 --partitions 9 --replication-factor 1 --topic "fasten.$topic.out"
  kafka-topics.sh --create --zookeeper localhost:2181 --partitions 9 --replication-factor 1 --topic "fasten.$topic.err"
done

kafka-topics.sh --create --zookeeper localhost:2181 --partitions 9 --replication-factor 1 -topic fasten.RapidPlugin.log
kafka-topics.sh --create --zookeeper localhost:2181 --partitions 9 --replication-factor 1 -topic fasten.mvn.test