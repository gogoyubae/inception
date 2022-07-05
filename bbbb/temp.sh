#!/bin/sh

cd /var/www/localhost/htdocs
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
#default lighttpd.conf는 관리를 위해 HostOS로 복사해온다.

