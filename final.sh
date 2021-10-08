#!/bin/bash

echo "Installing HTTPD"
yum install -y httpd

echo "Starting HTTPD"
systemctl start httpd.service

echo "Adding Firewall Rules"
firewall-cmd --add-port 80/tcp --permanent
firewall-cmd --reload

echo "install php php-mysql"
yum install -y php php-mysql

echo "Starting php"
systemctl restart httpd.service

echo "Info"
yum info php-fpm

echo "Installing PHP"
yum install -y php-fpm

cd var/www/html/
echo '<?php phpinfo(); ?>' > index.php

echo "Install mariadb"
yum install -y mariadb-server mariadb

echo "starting mariadb"
systemctl start mariadb

echo "run simple security script"
mysql_secure_installation <<EOF
