#!/bin/bash
_now=$(date +"%Y_%m_%d")
export PGPASSWORD=postgres
_dbname="$1"
_replicationfile="$_dbname-ws_config-$_now.sql"
echo "Starting replication info backup to $_replicationfile..."
pg_dump --column-inserts -F plain -U postgres --table=ws_end_point --table=replication_info $_dbname > "$_replicationfile"

echo "Reinitializing database $1..."
psql -U postgres -c "DROP DATABASE $_dbname;"
psql -U postgres -c "CREATE DATABASE $_dbname;"

echo "Restoring database: $1..."
psql -U postgres -d $_dbname -f $2

echo "Restoring replication info from $_replicationfile..."
psql -U postgres -d $_dbname -c "DROP TABLE replication_info;"
psql -U postgres -d $_dbname -c "DROP TABLE ws_end_point;"
psql -U postgres -d $_dbname -f $_replicationfile

unset PGPASSWORD
