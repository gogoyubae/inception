#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]; then

	cp /tmp/wp-config.php /var/www/html/wp-config.php
	sleep 5;
	mysqladmin -h $MARIADB_HOST -u $WP_DATABASE_NAME --password=$WP_DATABASE_PWD --wait=60 ping 
    wp core download --allow-root
    #wp core config --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MRIADB_HOST --allow-root
    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USR $WP_EMAIL --role=editor --user_pass=$WP_PWD --allow-root
fi
/usr/sbin/php-fpm8 -F -R
