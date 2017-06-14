#!/bin/sh
prefix="/var/www/emails"
date=`date \+\%Y-\%m-\%d-\%H\%M\%S`

name="$prefix/$date.eml"
while IFS= read line
do
echo "$line" >> $name
done
chmod 777 $name
