CREATE DATABASE wordpress_db;
CREATE USER 'yubae'@'%' IDENTIFIED BY 'password';
GRANT ALL ON wordpress_db.* TO 'yubae'@'%';
FLUSH PRIVILEGES;
