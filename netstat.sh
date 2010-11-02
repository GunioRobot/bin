#!/usr/local/bin/bash
#
## Calomel.org  calomel_interface_stats.sh
#
SECS=`uptime | awk '{ if ($3 ~ /:/) { split($3,a,":"); print (a[1]*60+a[2])*60} else { split($3,b,":"); split($5,a,":"); print b[1]*86400+(a[1]*60+a[2])*60} }'`
EXT_IN=`netstat -b -n -I em0 | grep em0 | tail -1 | awk '{print $5}'`
EXT_OUT=`netstat -b -n -I em0 | grep em0 | tail -1 | awk '{print $6}'`

echo " "
echo "External interface bandwidth usage:"
echo " uptime             " $(($SECS/86400)) "days"
echo " ExtIf in total     " $(($EXT_IN/1000000000)) "GBytes"
echo " ExtIf out total    " $(($EXT_OUT/1000000000)) "GBytes"
echo " ExtIf in/day       " $(($EXT_IN*86400/$SECS/1000000)) "MBytes/day"
echo " ExtIf out/day      " $(($EXT_OUT*86400/$SECS/1000000)) "MBytes/day"
echo " ExtIf in/30day     " $(($EXT_IN*86400*30/$SECS/1000000000)) "GBytes/month"
echo " ExtIf out/30day    " $(($EXT_OUT*86400*30/$SECS/1000000000)) "GBytes/month"
echo " ExtIf in+out/30day " $((($EXT_OUT+$EXT_IN)*86400*30/$SECS/1000000000)) "GBytes/month"
