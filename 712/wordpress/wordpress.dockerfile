FROM alpine:3

EXPOSE 9000
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN apk add --update wget curl bash util-linux openrc mysql-client git\
					php \
					php-fpm \
					php-iconv \
					php-json \
					php-mysqli \
					php-phar

COPY conf/www.conf /etc/php8/php-fpm.d/www.conf

COPY tools/configure.sh ./configure.sh

WORKDIR /var/www/html

RUN chmod a+x /configure.sh
CMD /bin/sh /configure.sh
