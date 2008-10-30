#!/bin/bash
# Note: -q means fetch quietly so that this program is silent
# Run this from cron:
# Every 10 minutes (at 7 minutes past the hour) 
# 7,17,27,37,47,57 * * * * /home/gregf/gmailbackup.sh
/usr/bin/getmail -q -r /home/gregf/.getmail/getmailrc 
