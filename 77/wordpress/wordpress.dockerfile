#FROM alpine:3.13 
FROM debian:buster

#RUN apk update && apk add --no-cache php7 php-fpm php-cli wget curl php-mbstring php-xml vim openrc
RUN apt-get update -y && apt-get install -y mariadb-client php7.3 php-fpm php-cli wget curl php-mysql php-mbstring php-xml sendmail vim 

COPY ./wp-config-temp.php /var/www/html/wp-config.php 

RUN wget https://wordpress.org/latest.tar.gz && \
tar -xvf latest.tar.gz && \
mv /wordpress/* /var/www/html/ && \
chown -R www-data:www-data /var/www/html && \ 
rm -r /wordpress latest.tar.gz

RUN wget https://raw.githubusecontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/script.sh ./script.sh

#WORKDIR /var/www/html/wordpress
RUN chmod a+x /script.sh

ENTRYPOINT ["tail", "-f"]
#ENTRYPOINT ["./script.sh"]
