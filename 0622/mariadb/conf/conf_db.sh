service mysql start

#mysql -uroot -h localhost -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password;"
#mysql -uroot -h localhost -e "UPDATE user SET authentication_string='$MYSQL_ROOT_PWD' WHERE user='root@localhost';"
#mysql -uroot -p${MYSQL_ROOT_PWD} -h localhost -e "CREATE DATABASE $WP_DATABASE_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;"
#mysql -uroot -p${MYSQL_ROOT_PWD} -h localhost -e  "CREATE USER '$WP_DATABASE_USR'@'%' IDENTIFIED by '$WP_DATABASE_PWD';"
#mysql -uroot -p${MYSQL_ROOT_PWD} -h localhost -e "GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_DATABASE_USR'@'%';"
#mysql -uroot -p${MYSQL_ROOT_PWD} -h localhost -e "FLUSH PRIVILEGES;"

mysql -e "CREATE DATABASE wordpress_db;"
mysql -e "CREATE USER 'yubae'@'%' IDENTIFIED BY 'password';"
mysql -e "GRANT ALL ON wordpress_db.* TO 'yubae'@'%';"
mysql -e "FLUSH PRIVILEGES;"
