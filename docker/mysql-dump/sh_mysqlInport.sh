#!/bin/sh

path='cat ./latest.txt'
if ["$1" != "latest"] ; then
  mysql -h 192.168.33.33 -u root -proot prm < $1
else
  mysql -h 192.168.33.33 -u root -proot prm < 'cat ./latest.txt'
fi
