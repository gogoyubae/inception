FROM debian:buster 

RUN apt-get update -y && apt-get install -y mariadb-server vim

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
#COPY ./conf/setDB.sql /etc/mysql/setDB/setDB.sql

#RUN service mysql /etc/mysql/set/setDB.sql
COPY ./conf/conf_db.sh ./
RUN chmod 777 /conf_db.sh
RUN sh ./conf_db.sh

ENTRYPOINT ["mysqld"]
#ENTRYPOINT ["sh", "./script.sh"]
