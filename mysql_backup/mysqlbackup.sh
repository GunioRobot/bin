#!/bin/bash

#
# Edit These
#

HOSTNAME="gila.lizardhost.co.uk"
BACKUP="/home/gregf/mysql_backups"
TMPDIR=${BACKUP}/$$
USER="gregf"
GROUP="gregf"
NOW=$(date +"%H%M")
DAY=$(date +"%m.%d.%Y")

# cd to the script dir to make sure files are put here
# --lock-all-tables < use this on final backups
if [ ! -d ${BACKUP} ]; then
    mkdir -p ${BACKUP}
fi

if [ ! -d ${BACKUP}/${DAY} ]; then
    mkdir -p ${BACKUP}/${DAY}
fi

if [ ! -d ${TMPDIR} ]; then
    mkdir -p ${TMPDIR}
fi

cd ${TMPDIR}

if [ $PWD != ${BACKUP} ]; then
    echo "Can't chdir to ${BACKUP}. Check permissions and retry"
    exit 0
fi

DATABASES="$(mysql -h ${HOSTNAME} -Bse 'SHOW DATABASES')"

# loop through the databases
for DB in ${DATABASES[@]}
do
    mkdir -p "$DB"
    TABLES="$(mysql -h ${HOSTNAME} $DB -Bse 'SHOW TABLES')"
    # loop through the tables in the database
    for TABLE in ${TABLES[@]}
    do
        #mysqldump --compress --add-locks -h ${HOSTNAME} "$DB" "$TABLE" > "${DB}/${TABLE}.sql"
        echo
    done
done

#
# Tarball tables
#
for MTABLE in *; do
    ARCHIVE="${MTABLE}-${NOW}.gz"
    nice -n19 ionice -c3 tar -cf ${BACKUP}/${DAY}/${ARCHIVE} ${MTABLE} 
    nice -n19 ionice -c3 lzma -q -z -8 ${BACKUP}/${DAY}/${ARCHIVE}
    rm -rf ${TMPDIR}
done

#
# Set sane permissions
#

chown -R ${USER}:${GROUP} ${BACKUP}

#
# Remove Backups older than 3 Days
#

find ${BACKUP} -mtime +1 -exec rm -rf {} \;
