FROM debian:buster 

ARG WP_DATABASE_NAME
ARG WP_DATABASE_USR
ARG WP_DATABASE_PWD

RUN apt-get update -y && apt-get install -y mariadb-server vim

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./conf/conf_db.sh ./
RUN chmod 777 /conf_db.sh
RUN sh ./conf_db.sh

ENTRYPOINT ["mysqld"]
