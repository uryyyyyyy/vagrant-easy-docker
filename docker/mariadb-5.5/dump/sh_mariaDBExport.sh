#!/bin/sh

mysqldump -h 192.168.33.33 -u admin -padmin -A > ./`date +%Y%m%d%H%M`$1.sql

