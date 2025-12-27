FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app

# System deps + Python
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl gnupg apt-transport-https \
    python3 python3-pip python3-venv \
    unixodbc unixodbc-dev \
    python3-pyodbc \
    && rm -rf /var/lib/apt/lists/*

# Microsoft repo (ODBC driver + optional sqlcmd)
RUN curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft.gpg \
 && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/24.04/prod noble main"  > /etc/apt/sources.list.d/microsoft-prod.list \
 && apt-get update \
 && ACCEPT_EULA=Y apt-get install -y --no-install-recommends \
    msodbcsql18 \
    mssql-tools18 \
 && echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> /etc/profile.d/mssql-tools.sh \
 && rm -rf /var/lib/apt/lists/*

# A tiny "wait for DB" script
COPY wait_for_db.py /app/wait_for_db.py

# (Optional) your app/migrations go here
# COPY . /app

CMD ["bash"]
