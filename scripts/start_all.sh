#!/bin/bash
# This scripts launches all the FASTEN plug-ins by all partners

# TUD plug-ins
nohup java -cp /home/fasten/projects/fasten/docker/server/server-0.0.1-SNAPSHOT-with-dependencies.jar eu.fasten.server.FastenServer -p /home/fasten/projects/fasten/docker/plugins/ -k localhost:9092 -pl "POMAnalyzer,RepoCloner,OPAL,MetadataDBExtension,GraphDBExtension" -kt "POMAnalyzer=fasten.mvn.test,RepoCloner=fasten.POMAnalyzer.out,OPAL=fasten.POMAnalyzer.out,MetadataDBExtension=fasten.OPAL.out,GraphDBExtension=fasten.MetadataDBExtension.out" -d "jdbc:postgresql:fasten_java" -du "fasten" -po "OPAL=/home/fasten/data/" -b "/home/fasten/data/repos" -gd "/home/fasten/data/graphdb/" > /home/fasten/logs/tud_fastenserver_logs &
nohup java -cp /home/fasten/projects/tud_security_plugin/vulnerability-plugin-0.0.1-SNAPSHOT-with-dependencies.jar eu.fasten.analyzer.vulnerabilityplugin.Main -db "jdbc:postgresql:fasten_java" -dbu "fasten" -json_path /home/fasten/projects/tud_security_plugin/data.json > /home/fasten/logs/tud_vul_analyzer_logs &

# SIG plug-ins
nohup python3 /home/fasten/projects/quality-analyzer/rapidplugin/entrypoint.py fasten.RepoCloner.out fasten.RapidPlugin.out fasten.RapidPlugin.err fasten.RapidPlugin.log localhost:9092 fasten.RapidPlugin.demo 1 > /home/fasten/logs/sig_rapidplugin_logs &

# AUEB plug-ins
nohup python3 /home/fasten/projects/pypi-tools/cg-producer/entrypoint.py fasten.pypi_coords.out fasten.pycg.out fasten.pycg.err 127.0.0.1:9092 fasten.pycg 5 300000 > /home/fasten/logs/aueb_pycg_logs &
