#!/bin/bash

topics=(GraphDBExtension MetadataDBExtension OPAL POMAnalyzer RepoCloner pypi_coords pycg)

for topic in "${topics[@]}"; do
  kafka-topics.sh --zookeeper localhost:2181 --delete --topic "fasten.$topic.out"
  kafka-topics.sh --zookeeper localhost:2181 --delete --topic "fasten.$topic.err"
done

for topic in "${topics[@]}"; do
  kafka-topics.sh --create --zookeeper localhost:2181 --topic "fasten.$topic.out"
  kafka-topics.sh --create --zookeeper localhost:2181 --topic "fasten.$topic.err"
done

kafka-consumer-groups.sh --bootstrap-server localhost:9092 --delete --group eu.fasten.analyzer.pomanalyzer.POMAnalyzerPlugin.POMAnalyzer
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --delete --group eu.fasten.analyzer.javacgopal.OPALPlugin.OPAL
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --delete --group eu.fasten.analyzer.repoclonerplugin.RepoClonerPlugin.RepoCloner
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --delete --group eu.fasten.analyzer.metadataplugin.MetadataDatabasePlugin.MetadataDBExtension
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --delete --group eu.fasten.analyzer.graphplugin.GraphDatabasePlugin.GraphDBExtension
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --delete --group fasten.pycg

