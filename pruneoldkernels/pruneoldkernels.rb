#!/usr/bin/ruby
# vim: set sw=2 sts=2 et tw=80 :

#TODO
#1. uname -r to get current kernel, get list of all kernel version from /lib/modules
#2. Remove all kernels not matching uname -r in /lib/modules /usr/src
#3. mount /boot
#4. rm old kernels and system maps
#5. lzma old configs move them to /boot/oldconfigs
#6. ask if we should open grub.conf in $EDITOR
#7. Accept command line option for specify kernel versions to remove
#8. Accept command line option to keep specific kernel versions
