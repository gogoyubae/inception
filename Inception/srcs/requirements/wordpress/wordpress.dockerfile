#FROM alpine:3.13 
FROM debian:buster
EXPOSE 9000

#RUN apk update && apk add --no-cache wget curl bash util-linux openrc mysql-client git\
#					php \
#					php-fpm \
#					php-iconv \
#					php-json \
#					php-mysqli \
#					php-phar
RUN apt-get update -y && apt-get install -y mariadb-client php7.3 php-fpm php-cli wget curl php-mysql php-mbstring php-xml sendmail vim 

#COPY ./wp-config-temp.php /var/www/html/wp-config.php 

RUN mkdir -p /var/www/html/wordpress
RUN wget https://wordpress.org/latest.tar.gz && \
tar -xvf latest.tar.gz && \
mv /wordpress/* /var/www/html/wordpress && \
chown -R www-data:www-data /var/www/html/wordpress && \ 
#rm -r /wordpress latest.tar.gz
rm -r latest.tar.gz

RUN wget https://raw.githubusecontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar ./usr/local/bin/wp

COPY tools/script.sh ./script.sh
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir -p /run/php
RUN chmod a+x /script.sh

WORKDIR /var/www/html/wordpress

# ENTRYPOINT ["tail", "-f"]
#ENTRYPOINT ["./script.sh"]
CMD ["/bin/sh", "/script.sh"]
