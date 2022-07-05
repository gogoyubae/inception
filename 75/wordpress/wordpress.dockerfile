FROM alpine:3.13 

RUN apk update && apk add --no-cache php7 php-fpm php-cli wget curl php-mbstring php-xml vim openrc
COPY ./wp-config-temp.php /var/www/html/wp-config.php 

RUN wget https://wordpress.org/latest.tar.gz && \
tar -xvf latest.tar.gz && \
mv /wordpress/* /var/www/html/ && \
chown -R www-data:www-data /var/www/html && \ 
rm -r /wordpress latest.tar.gz
#ENTRYPOINT ["sh", "./temp.sh"]
