psql -w -U postgres -h 127.0.0.1 -f /home/fasten/scripts/psql_initialise.sql
psql -w -d fasten_java -U fasten -h 127.0.0.1 -f /home/fasten/scripts/psql_create_tables.sql
