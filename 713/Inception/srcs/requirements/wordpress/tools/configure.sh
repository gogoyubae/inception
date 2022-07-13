#!/bin/bash

if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then

	cp /tmp/wp-config.php /var/www/html/wordpress/wp-config.php
	wp core download --allow-root
    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USR $WP_EMAIL --role=editor --user_pass=$WP_PWD --allow-root
fi
/usr/sbin/php-fpm8 -F -R
