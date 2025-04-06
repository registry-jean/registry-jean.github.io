-- Script d'initialisation
CREATE DATABASE IF NOT EXISTS myapp_db;

CREATE USER IF NOT EXISTS 'myapp_user'@'%' IDENTIFIED BY 'myapp_password';

GRANT ALL PRIVILEGES ON myapp_db.* TO 'myapp_user'@'%';

FLUSH PRIVILEGES;