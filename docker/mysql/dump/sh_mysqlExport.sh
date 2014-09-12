#!/bin/sh

mysqldump -h 192.168.33.33 -u root -proot -A > ./`date +%Y%m%d%H%M`$1.sql

