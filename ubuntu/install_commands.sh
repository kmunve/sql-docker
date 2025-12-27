#!/bin/bash

# Import the public repository GPG keys
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/microsoft.gpg
# Register the Microsoft SQL Server Ubuntu repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/24.04/prod noble main" > /etc/apt/sources.list.d/mssql-release.list
# Update the package lists
apt update

# Install the ODBC driver
ACCEPT_EULA=Y apt install -y msodbcsql18

# Verify installation
odbcinst -q -d

# Install additional required packages
apt install -y python3 python3-pip curl ca-certificates gnupg unixodbc python3-pyodbc