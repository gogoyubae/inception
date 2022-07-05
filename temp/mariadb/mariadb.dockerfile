FROM alpine:3.16

RUN apk update && apk add mariadb mariadb-client

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/setDB.sql /etc/mysql/setDB/setDB.sql

#RUN service mysql start
#ENTRYPOINT ["sh", "./script.sh"]
