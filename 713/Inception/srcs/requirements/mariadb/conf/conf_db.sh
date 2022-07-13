service mysql start

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -uroot -e "CREATE USER IF NOT EXISTS 'yubae'@'%' IDENTIFIED BY '0000';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'yubae'@'%';"
mysql -uroot -e "FLUSH PRIVILEGES;"
mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '0000';"
