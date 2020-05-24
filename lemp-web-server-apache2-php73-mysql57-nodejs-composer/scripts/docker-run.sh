#!/bin/bash

echo "Starting application and webserver...";

#echo "php -v";
#php -v
#echo "apache2 -v";
#apache2 -v
#echo "mysql -V";
#mysql -V

echo "will start mysql";
/etc/init.d/mysql start 
#echo "mysql status below";
/etc/init.d/mysql status

echo "will start apache2";
apache2ctl -D FOREGROUND
#/usr/sbin/apache2ctl -DFORGROUND



echo "apache2 status below";
service apache2 status



