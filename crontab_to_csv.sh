#!/bin/bash

crontab_csv_file="crontab.csv"

echo "cron_host,cron_user,minutes,hours,days,months,day_of_the_week,cron_name,cron_parameter" > $crontab_csv_file
crontab -l | grep -v ^# | grep -v ^$ | grep -v MAILTO | sed -e "s/  */ /g" -e "s/ /,/1" -e "s/ /,/1" -e "s/ /,/1" -e "s/ /,/1" -e "s/ /,/1" | awk '{$0="'`hostname -s`','$USER'," $0 "";print}' >> $crontab_csv_file

if [ -f $crontab_csv_file ] ; then
  cat $crontab_csv_file
else
  echo "file not found $crontab_csv_file."
fi
