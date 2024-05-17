#!/bin/bash

# Define your date string
#date_string="Mar 29 21:28:24"
#
## Convert date string to timestamp
#timestamp=$(date -d "$date_string" +"%F %T")
#
#echo "Timestamp for '$date_string' is: $timestamp"

line="Mar 30 00:00:00 DESKTOP-N4LQ7I8 systemd[1]: Finished Daily dpkg database backup service."
arr=($line)
IFS=$'\n'; arr=($line); unset IFS;
echo "${arr[0]} "
