FROM mysql
COPY initScript.sql createDB.sql /docker-entrypoint-initdb.d/