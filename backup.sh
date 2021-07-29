#!/bin/bash

echo "echo using double quotes \"\":"
echo "$PATH"

echo "echo using single quotes '':"
echo '$PATH'

echo "Printing the \$SSH_CONNECTION variable"
echo $SSH_CONNECTION

echo 'Printing the $SSH_CONNECTION variable'
echo $SSH_CONNECTION

echo "Printing the \$PWD env. variable"
echo $PWD

echo 'Printing the $PWD env. variable'
echo $PWD

# Backing up the required files

echo "checking if the backup directory exists"

if [ ! -d ~/binaries/ ]; then
        echo "the directory does not exist; creating it"
        mkdir ~/binaries/
fi

echo "copying files"

cp /usr/sbin/xfs* ~/binaries/

#echo "creating a secondary backup directory" && mkdir ~/secondary/ || echo $? && exit 127

echo "creating a tertiary backup directory" && mkdir ~/tertiary/ 2> /dev/null || echo "exit code is not 0 but..." $? && echo "tertiary backup directory already exists"
echo "copying files" && cp -v /usr/bin/* ~/tertiary/ > tertiary-backup.log 2>&1

grep -i denied tertiary-backup.log | tail -n 2


echo "listing the content of directories we have no read permission for..." && ls -R /proc/1/f* > ls.log 2>&1
grep -i denied ls.log | tail -n 2

exit 0
