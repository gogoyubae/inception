FROM alpine:3.13 

RUN apk update && apk add --no-cache php7 php-fpm php-cli wget curl php-mbstring php-xml vim openrc
#COPY ./wp-config-temp.php /var/www/html/wp-config.php 

ENTRYPOINT ["sh", "./temp.sh"]
