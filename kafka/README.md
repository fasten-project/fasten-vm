# Apache Kafka settings and configuration
In order to set up the Apache Kafka, the following considerations should be taken into account:

## server.properties
- The value of `log.retention.hours` is set to `87600` to make Kafka records permanent.
- The `delete.topic.enable` is set to `true` so that Kafka topics can be deleted.
- The value of `advertised.host.name` and `port` are set to `localhost` and `9092` so that the Kafka server is accessible by APIs and third-party tools.
- By default, Kafka stores its logs (i.e. records) on `/tmp/` folder. Hence the Kafka topics and their records will be deleted after a reboot. To solve this, the `log.dirs` is set a local folder, which is `/home/fasten/kafka/topics_data`.

## zookeeper.properties
- The value of `dataDir` is set to a local folder: `/home/fasten/kafka/zk_data`.
- Note that the data of both Kafka and Zookeeper are stored on local folders to make their data persistent after rebooting the machine.

## Troubleshooting
- Use the following commands in the terminal to restart Kafka and Zookeeper services:
```
sudo systemctl restart kafka.service
sudo systemctl restart zookeeper.service
```
- The Kafka's internal errors and exceptions are stored here: `/home/fasten/kafka/kafka.log`.