FROM debian:buster

RUN apt-get update -y && apt-get install -y mariadb-client\
    php7.3 php-fpm php-cli wget curl php-mysql php-mbstring php-xml sendmail vim

#ENTRYPOINT ["sh", "./temp.sh"]
