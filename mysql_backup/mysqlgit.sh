#!/bin/bash

#
# Edit These
#

HOSTNAME="gila.lizardhost.co.uk"
BACKUP="/storage/mysql_backups"
USER="gregf"
GROUP="gregf"
# Date used for git commit messages
NOW=$(date +"%m-%d-%Y %I:%M%p")

# cd to the script dir to make sure files are put here
# --lock-all-tables < use this on final backups
cd ${BACKUP}

DATABASES="$(mysql -h ${HOSTNAME} -Bse 'SHOW DATABASES')"

# loop through the databases
for DB in ${DATABASES[@]}
do
    mkdir -p "$DB"
    TABLES="$(mysql -h ${HOSTNAME} $DB -Bse 'SHOW TABLES')"
    # loop through the tables in the database
    for TABLE in ${TABLES[@]}
    do
        mysqldump --compress --add-locks -h ${HOSTNAME} "$DB" "$TABLE" > "${DB}/${TABLE}.sql"
    done
done

#
# version control
#
nice -n19 $(
ionice -c3 git add .
ionice -c3 git commit -m "cron backup ${NOW}"
)
#
# Set sane permissions
#

chown -R ${USER}:${GROUP} ${BACKUP}
