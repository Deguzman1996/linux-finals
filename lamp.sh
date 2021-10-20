#!/bin/bash

echo "########################"
echo "#                      #"
echo "# Start of the script  #"
echo "#                      #"
echo "########################"
echo " "
echo "Installing httpd"
yum install -y httpd


echo "Starting httpd"
systemctl start httpd.service

echo "Adding firewall rules"
firewall-cmd --add-port 80/tcp --permanent
firewall-cmd --add-port 443/tcp --permanent

echo "Reload firewall"
firewall-cmd --reload

echo "Enabling httpd"
systemctl enable httpd.service

#End of httpd installation
#http://ip_address
echo " "

echo "Installing  php and php-mysql"
yum install -y php php-mysql

echo "restarting httpd"
systemctl restart httpd.service

echo "Installing php-fpm"
yum install -y php-fpm 

echo "creating php website"
cd /var/www/html
cat > info.php <<- info
<?php phpinfo(); ?>
info

#End of php installaion
#http://ip_address/info.php
echo " "

echo "Installing mysql"
yum install -y mariadb-server mariadb

echo "starting mariadb"
systemctl start mariadb.service

mysql_secure_installation << secure

Y
linux
linux
Y
Y
Y
Y
secure


echo "enabling mariadb"
systemctl enable mariadb.service

echo "checking mariadb version"
mysqladmin -u root -plinux version 

#end of mariadb installaion

echo "creating wordpress database"
mysql -u root --password=linux << mysql
CREATE DATABASE wordpress;
CREATE USER wordpressuser@localhost IDENTIFIED BY 'linux123';
GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost IDENTIFIED BY 'linux123'; 
FLUSH PRIVILEGES;
mysql

echo "installing php-gd"
yum install php-gd -y

echo "restarting httpd"
systemctl restart httpd

cd /opt/
echo "installing wget"
yum install wget -y
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
yum install yum-utils -y

echo "restart httpd"
systemctl restart httpd

echo "downloading wordpress from website"
wget http://wordpress.org/latest.tar.gz

echo "extracting file"
tar xzvf latest.tar.gz

echo "installing rsync"
yum install rsync -y

yum-config-manager --enable remi-php56 -y
yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo -y

echo "copy wordpress files to html directory"
rsync -avP wordpress/ /var/www/html/

echo "creating uploads folder"
mkdir /var/www/html/wp-content/uploads

echo "changing wordpress file owner to apache"
chown -R apache:apache /var/www/html/*

cd /var/www/html

echo "copy wp-config-sample.php"
cp wp-config-sample.php wp-config.php

echo "configuring wordpress"
sed -i 's/database_name_here/wordpress/g' /var/www/html/wp-config.php
sed -i 's/username_here/wordpressuser/g' /var/www/html/wp-config.php
sed -i 's/password_here/linux123/g' /var/www/html/wp-config.php

#end of configuring wordpress

echo "restarting httpd"
systemctl restart httpd.service
#wordpress must be displayed in your ip_address

echo "End of wordpress installation"

echo "########################"
echo "#                      #"
echo "# End  of the script   #"
echo "#                      #"
echo "########################"
