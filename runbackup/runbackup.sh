#!/bin/sh
# Run this script at idle priority
ionice -c3 /usr/bin/nice -n 15 /usr/bin/rsnapshot -c /etc/rsnapshot/rsnapshot.conf daily
