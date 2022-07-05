#/docker/wordpress/config/Dockerfile
#Alpine Linux OS를 기반으로 한다.
FROM alpine:3.15
RUN apk update

#Wordpress설치에 필요한 패키지
RUN apk add lighttpd php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml php7-zip

#php.ini file upload size
RUN sed -ri 's/upload_max_filesize = 2M/upload_max_filesize = 4M/g' /etc/php7/php.ini

#php에서 사용하는 Memory 사용량 증설
RUN sed -ri 's/memory_limit = 128M/memory_limit = 256M/g' /etc/php7/php.ini

#lighttpd.conf
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

#index.php
#COPY index.php /var/www/localhost/htdocs/index.php

#PID
RUN mkdir /run/lighttpd
RUN chown -R lighttpd /run/lighttpd

#Foreground
ENTRYPOINT ["lighttpd", "-f", "/etc/lighttpd/lighttpd.conf", "-D"]
#ENTRYPOINT ["sh", "/bin/sh"]
