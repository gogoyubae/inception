FROM debian:buster

RUN apt-get update -y  && apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/setDB.sql /etc/mysql/setDB/setDB.sql

#RUN service mysql start
#ENTRYPOINT ["sh", "./script.sh"]
