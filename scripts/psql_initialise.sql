-- Create default read/write user and databases

create user fasten with encrypted password 'fasten1234'; -- change me
ALTER USER fasten with CREATEDB;

create database fasten_java ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' TEMPLATE template0;
create database fasten_rust ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' TEMPLATE template0;
create database fasten_c ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' TEMPLATE template0;
create database fasten_python ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' TEMPLATE template0;

grant all privileges on database fasten_java to fasten;
grant all privileges on database fasten_rust to fasten;
grant all privileges on database fasten_c to fasten;
grant all privileges on database fasten_python to fasten;
-- Create a readonly user for querying

CREATE USER fastenro WITH ENCRYPTED PASSWORD 'fasten';

GRANT CONNECT ON DATABASE fasten_java TO fastenro;
GRANT CONNECT ON DATABASE fasten_rust TO fastenro;
GRANT CONNECT ON DATABASE fasten_c TO fastenro;
GRANT CONNECT ON DATABASE fasten_python TO fastenro;

ALTER DATABASE fasten_java OWNER to fasten;
ALTER DATABASE fasten_rust OWNER to fasten;
ALTER DATABASE fasten_c OWNER to fasten;
ALTER DATABASE fasten_python OWNER to fasten;

\c fasten_java
GRANT USAGE ON SCHEMA public TO fastenro;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO fastenro;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO fastenro;
\c fasten_rust
GRANT USAGE ON SCHEMA public TO fastenro;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO fastenro;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO fastenro;

\c fasten_c
GRANT USAGE ON SCHEMA public TO fastenro;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO fastenro;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO fastenro;

\c fasten_python
GRANT USAGE ON SCHEMA public TO fastenro;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO fastenro;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO fastenro;
