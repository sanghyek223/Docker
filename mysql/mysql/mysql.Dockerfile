FROM mysql:5.5

COPY utf8.cnf /etc/mysql/conf.d/
COPY initdb.sql /docker-entrypoint-initdb.d/