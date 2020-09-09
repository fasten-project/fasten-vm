-- Create default read/write user and databases

create user fasten with encrypted password 'fasten1234'; -- change me
ALTER USER fasten with CREATEDB;

create database fasten_java ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' TEMPLATE template0;
grant all privileges on database fasten_java to fasten;
