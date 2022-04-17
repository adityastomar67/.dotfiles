#!/bin/bash

sudo pacman -S mariadb
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl enable mariadb.service
sudo systemctl start mariadb.service
sudo mysql_secure_installation
sudo mysql -u root -p
MariaDB [(none)]:- CREATE USER 'username'@'localhost' IDENTIFIED BY 'some_pass';
    On 'username' --- "write your username"
    On 'some_pass' --- "write your password"
MariaDB [(none)]:- GRANT ALL PRIVILEGES ON *.* TO 'username'@'localhost';
flush privileges;
quit
