# Data
Here, datasets and input coordinates are stored for running the FASTEN pipline and demo.

## Java coordinates
To read `mvn.cords.txt` file and create a key-record format for sending to Kafka, use the followin command:
```
cat 121Coordinates.txt | awk -F: '{print $1":"$2":"$3"|{\"groupId\":\""$1"\",\"artifactId\":\""$2"\",\"version\":\""$3"\"}"}' > mvn.cords.txt
```

To send the Maven coordinates to a Kafka topic, use the following command:
```
kafka-console-producer.sh --broker-list localhost:9092 --topic fasten.mvn.test --property "parse.key=true" --property "key.separator=|" < mvn.cords.txt
```

## Python coordinates

To send the PyPI package coordinates to a Kafka topic, use the following
command:

```
kafka-console-producer.sh --broker-list localhost:9092 --topic fasten.pypi_coords.out < py.coords.json
```
