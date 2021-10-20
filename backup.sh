#!/bin/bash
echo "########################"
echo "#                      #"
echo "# Start of the script  #"
echo "#                      #"
echo "########################"

date_today=$(date +'%m%d%y')

echo "creating folder to backup wordpress database"
mkdir /opt/backups
cd /opt/backups

echo "creating mysqldump for wordpress database"
mysqldump -u root -plinux wordpress > wordpress_$date_today.sql

echo "file compressing"
tar -zcf wordpress_$date_today.tar.gz wordpress_$date_today.sql

echo "wordpress successfully backed up"

echo "########################"
echo "#                      #"
echo "# End of the script    #"
echo "#                      #"
echo "########################"
