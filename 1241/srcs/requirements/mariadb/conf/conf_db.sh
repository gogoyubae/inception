service mysql start

mysql -uroot -h  "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password;"
mysql -uroot -h  "UPDATE user SET authentication_string='$MYSQL_ROOT_PWD' WHERE user='root@localhost';"
mysql -uroot -e "CREATE DATABASE $WP_DATABASE_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot -e "CREATE USER '$WP_DATABASE_USR'@'%' IDENTIFIED by '$WP_DATABASE_PWD';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_DATABASE_USR'@'%';"
mysql -uroot -e "FLUSH PRIVILEGES;"
