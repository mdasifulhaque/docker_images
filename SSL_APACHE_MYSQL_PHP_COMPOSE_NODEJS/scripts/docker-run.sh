#!/bin/bash

echo "Starting application and webserver...";

echo "will start mysql";
/etc/init.d/mysql start 
#echo "mysql status below";
/etc/init.d/mysql status

echo "will start apache2";
apache2ctl -D FOREGROUND
#/usr/sbin/apache2ctl -DFORGROUND

echo "apache2 status below";
service apache2 status



