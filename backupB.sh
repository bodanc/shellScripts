#!/bin/bash

echo "creating backup directory" >> /home/cloud_user/backup.log
mkdir /home/cloud_user/work-backup

echo "copying files" >> /home/cloud_user/backup.log
cp -v /home/cloud_user/work/* /home/cloud_user/work-backup >> /home/cloud_user/backup.log

echo "finished copying files" >> /home/cloud_user/backup.log
