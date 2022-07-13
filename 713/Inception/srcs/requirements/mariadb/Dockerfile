FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server

RUN mkdir var/run/mysqld
RUN chmod 777 var/run/mysqld
COPY conf/conf_db.sh ./
RUN chmod 777 /conf_db.sh



RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sh ./conf_db.sh
ENTRYPOINT ["mysqld"]
