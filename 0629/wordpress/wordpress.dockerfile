FROM debian:buster

RUN apt-get update -y  && apt-get -y install php7.3 php-fpm php-cli wget curl php-mbstring php-xml vim mariadb-client

COPY ./wp-config-temp.php /var/www/html/wp-config.php 

ENTRYPOINT ["sh", "./temp.sh"]
