FROM debian:buster 
EXPOSE 3306
#ARG MARIADB_PWD
#ARG WP_DATABASE_NAME
#ARG WP_DATABASE_USR
#ARG WP_DATABASE_PWD

RUN apt-get update -y && apt-get install -y mariadb-server vim

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./tools /var/www

RUN service mysql start && mysql < /var/www/initial_db.sql && rm -f /var/www/initial_db.sql;

ENTRYPOINT ["mysqld"]
