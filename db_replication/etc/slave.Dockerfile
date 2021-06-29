FROM mariadb:10

COPY utf8.cnf /etc/mysql/conf.d/
COPY initdb.sql /docker-entrypoint-initdb.d/
COPY initdb2.sql /docker-entrypoint-initdb.d/

RUN apt-get update -y
RUN apt-get install vim -y