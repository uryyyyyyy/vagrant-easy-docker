#!/bin/sh

mysqldump -h 192.168.33.33 -u root -proot prm > /media/shiba/backup/develop/dbDump/prm1-mysql/`date +%Y%m%d%H%M`$1.sql
echo /media/shiba/backup/develop/dbDump/prm1-mysql/`date +%Y%m%d%H%M`$1.sql > latest.txt
