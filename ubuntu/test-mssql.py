import pyodbc

conn_str = (
    "DRIVER={ODBC Driver 18 for SQL Server};"
    "SERVER=db;"
    "DATABASE=master;"
    "UID=sa;"
    "PWD=FirstIdeal1;"
    "TrustServerCertificate=yes;"
)

with pyodbc.connect(conn_str) as conn:
    cursor = conn.cursor()
    cursor.execute("SELECT name FROM sys.databases;")

    for row in cursor.fetchall():
        print(row.name)


# Run: python3 test-mssql.py