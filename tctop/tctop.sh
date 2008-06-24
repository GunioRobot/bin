#! /bin/sh

delay=1     # default delay between screen updates
iface=eth0  # default interface to show statistics for


qdisc()
{
	tc -s qdisc ls dev ${iface}
}

class()
{
	tc -s class ls dev ${iface}
}

all()
{
	qdisc
	echo
	class
}

usage()
{
	echo "Usage: `basename $0` [OPTION]... qdisc|class|all"
	echo "Display traffic control statistics in real time."
	echo
	echo "  -d DELAY     wait DELAY seconds between screen updates"
	echo "  -i INTERFACE show statistics for INTERFACE"

	exit 1
}


while getopts hd:i: name
do
	case $name in
		d)   delay=$OPTARG ;;
		i)   iface=$OPTARG ;;
		h|?) usage ;;
	esac
done

shift $(($OPTIND - 1))

case $1 in
	qdisc) cmd=qdisc ;;
	class) cmd=class ;;
	all)   cmd=all ;;
	*)     usage ;;
esac

while true
do
	clear
	$cmd
	sleep $delay
done
