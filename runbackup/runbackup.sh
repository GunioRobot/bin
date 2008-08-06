#!/bin/sh
# Run this script at idle priority
ionice -c3 -p$$
mount /usb
/usr/bin/nice -n 15 /usr/bin/rsnapshot -c /etc/rsnapshot/rsnapshot.conf daily 
sleep 3
umount /usb
