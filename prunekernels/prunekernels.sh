#!/bin/bash

#clean /lib/modules
cd /lib/modules
ls -1rt | head -n -2 | xargs --no-run-if-empty rm -fr

# clean /boot
grep --quiet /boot /etc/fstab && mount /boot -o remount,rw
cd /boot
ls -1rt config-* | head -n -2 | while read f; do
        bzip2 -9 $f
        mv $f.bz2 oldconfigs/
        done

ls -1rt System.map-* | head -n -2 | xargs --no-run-if-empty rm -f
if [ -f vmlinux ]; then
        ls -1rt vmlinux-* | head -n -2 | xargs --no-run-if-empty rm -f
else
        ls -1rt vmlinuz-* | head -n -2 | xargs --no-run-if-empty rm -f
        fi

# clean /usr/src
cd /usr/src
ls -1drt linux-* | head -n -2 | xargs --no-run-if-empty rm -fr
equery --quiet list gentoo-sources | head -n -2 | xargs --no-run-if-empty emerge --unmerge &>/dev/null

grep --quiet /boot /etc/fstab && mount /boot -o remount,ro
