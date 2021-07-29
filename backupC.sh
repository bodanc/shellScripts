#!/bin/bash

BACKUP_SOURCE="/usr/bin/*"
BACKUP_DESTINATION="/home/$USER/bin-backup"
# the variable value will be passed in as a positional argument when calling the script
LOGFILE=$1

init() {
    echo "creating a backup directory" && mkdir $BACKUP_DESTINATION 2> /dev/null || echo "the directory already exists"
    echo "" > $LOGFILE

    # by default, a variable which is not prefixed by the 'local' keyword, will be global, even if declared inside a function body
    local NUMBER=42
    NUMBER=99
}

init

tail () {
    # starting the line with the 'command' keyword will ensure that the function doesn't call itself in an infinite loop
    command tail -n $1
}

echo "copying files"
cp -v $BACKUP_SOURCE $BACKUP_DESTINATION >> $LOGFILE 2>&1

echo "done!"

grep -i denied $LOGFILE | tail 20

echo $NUMBER


exit 0
