# Scripts description
There are two bash scripts for initializing Kafka and PostgreSQL DB, which are briefly explained as follows:

- `fasten_init_kafka.sh`: It deletes the FASTEN's Kafka topics and creates them again. It also deletes the consumer groups. Note that if you run the script for the first time, it may give errors or warnings that can be ignored.
- `fasten_initialize_db.sh`: It creates the FASTEN's SQL databases, users, tables, and indexes.

**NOTE:** To initialize Kafka and DBs, run the bash aliases that are explained in the `vm` folder, instead of executing the above-described shell scripts.