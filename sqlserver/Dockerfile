FROM mcr.microsoft.com/mssql/server:2022-latest

# Accept EULA at image level (still OK to override in compose)
ENV ACCEPT_EULA=Y
# Choose version, other alternatives: Express (free), Standard, Enterprise
ENV MSSQL_PID=Developer 

# Optional: default TCP port
EXPOSE 1433

# Switch to root for setup
USER root

# Copy init scripts
COPY init /docker-entrypoint-initdb.d

# Add init scripts once SQL Server is ready
COPY run-init.sh /usr/local/bin/run-init.sh
RUN chmod +x /usr/local/bin/run-init.sh

# Switch back to mssql user (VERY important)
USER mssql

# Optional healthcheck baked into the image
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=10 \
  CMD /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -Q "SELECT 1" || exit 1

# Start SQL Server, run init scripts, then stay alive...
ENTRYPOINT ["/usr/local/bin/run-init.sh"]