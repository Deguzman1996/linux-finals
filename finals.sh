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
