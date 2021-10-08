#router 1

vi lamp.sh

#!/bin/bash

echo "Installing HTTPD"
yum install -y httpd
echo "Starting HTTPD"
systemctl start httpd.service

echo "Adding Firewall Rules"
firewall-cmd --add-port 80/tcp --permanent
firewall-cmd --reload

echo "Enabling HTTPD.SERVICE"
sudo systemctl enable httpd.service

echo "Stop hhtpd"
sudo systemctl stop httpd

echo "disable httpd"
sudo systemctl disable httpd

echo "enable httpd"
sudo systemctl enable httpd

echo "restart httpd"
sudo systemctl restart httpd

echo "install php php-mysql"
sudo yum install php php-mysql

echo " install php php-mysql"
sudo systemctl install php php-mysql

echo "search php-"
yum search php-

echo "info lamp"
yum info lamp.sh

echo "infophp"
yum info php-fpm

echo "Install php"
sudo yum install php-fpm

echo "Install package"
sudo yum install package1 package2 

echo "website"
sudo vi /var/www/html/info.php

<?php phpinfo(); ?>

#cat lamp.sh

#router 2

#vi lamp.sh

echo "Installing HTTPD"
yum install -y httpd
echo "Starting HTTPD"
systemctl start httpd.service

echo "Adding Firewall Rules"
firewall-cmd --add-port 80/tcp --permanent
firewall-cmd --reload

#cat lamp.sh

#chmod +x lamp.sh
#./lamp.sh
