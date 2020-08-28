# VM's OS configuration
In the `.profile` file, a set of aliases, environment variables, and functions are defined to ease and facilitate running the FASTEN demo. Some of the frequently-used aliases are explained as follows:

- `init_kafka`: Initializes Kafka by deleting topics and consumer groups.
- `init_db`: Initializes the PostgreSQL DB (i.e. metadata DB) by creating DBs, tables, users, and indexes.
- `clean_fasten_db`: Erases the whole metadata DB, including the DB schema, tables, and users.
- `clean_fasten_data`: Erases all the local data that were produced by running the FASTEN demo. That is, call graphs, repositories, indexed graphs.
- `start_all`: Launches the FASTEN server with all the plug-ins.
- `psql_db`: Starts PostgreSQL CLI tool for running SQL queries, etc.