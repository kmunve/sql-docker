#!/usr/bin/env bash
set -e

# Start SQL Server in background
/opt/mssql/bin/sqlserver &

# Wait for SQL Server
echo "Waiting for SQL Server..."
until /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -Q "SELECT 1" >/dev/null 2>&1; do
  sleep 2
done

echo "SQL Server is up. Running init scripts..."

for f in /docker-entrypoint-initdb.d/*.sql; do
  [ -e "$f" ] || continue
  echo "Running $f"
  /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -i "$f"
done

wait
