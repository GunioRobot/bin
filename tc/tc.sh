#! /bin/sh

iface=eth0  # default network interface to apply shaping to
cap=560     # default cap


start()
{
	echo -n "Starting..."

	# htb queue capped at ${cap}kbit
	tc qdisc add dev ${iface} root handle 1: htb default 1
	tc class add dev ${iface} parent 1: classid 1:1 htb rate ${cap}kbit burst 128kb

	# prioritize traffic
	tc qdisc add dev ${iface} parent 1:1 handle 11: prio

	# use sfq for each priority level...
	tc qdisc add dev ${iface} parent 11:1 handle 111: sfq perturb 10
	tc qdisc add dev ${iface} parent 11:2 handle 112: sfq perturb 10
	tc qdisc add dev ${iface} parent 11:3 handle 113: sfq perturb 10

	# ... and add filters for them
	tc filter add dev ${iface} parent 11: protocol ip prio 1 handle 111 fw classid 11:1
	tc filter add dev ${iface} parent 11: protocol ip prio 2 handle 112 fw classid 11:2
	tc filter add dev ${iface} parent 11: protocol ip prio 3 handle 113 fw classid 11:3

	# prioritize icmp packets
	iptables -t mangle -A POSTROUTING -o ${iface} -p icmp -j MARK --set-mark 111
	iptables -t mangle -A POSTROUTING -o ${iface} -p icmp -j RETURN

	# prioritize tcp packets <=40 bytes (no payload, connection stuff)
	iptables -t mangle -A POSTROUTING -o ${iface} -p tcp -m length --length 0:40 -j MARK --set-mark 111
	iptables -t mangle -A POSTROUTING -o ${iface} -p tcp -m length --length 0:40 -j RETURN

	# prioritize http requests
	iptables -t mangle -A POSTROUTING -o ${iface} -p tcp --destination-port 80 -j MARK --set-mark 111
	iptables -t mangle -A POSTROUTING -o ${iface} -p tcp --destination-port 80 -j RETURN

	# deprioritize traffic from the given port
	#iptables -t mangle -A POSTROUTING -o ${iface} -p tcp --source-port $PORT -j MARK --set-mark 113
	#iptables -t mangle -A POSTROUTING -o ${iface} -p tcp --source-port $PORT -j RETURN

	echo " done."
}

stop()
{
	echo -n "Stopping..."

	tc qdisc del root dev ${iface}
	iptables -t mangle -F POSTROUTING

	echo " done."
}

status()
{
	echo "qdisc"
	echo "-----"
	echo
	tc -s qdisc ls dev ${iface}
	echo
	echo "class"
	echo "-----"
	echo
	tc -s class ls dev ${iface}
}

usage()
{
	echo "Usage: `basename $0` [OPTION]... start|stop|restart|status"
	echo "Setup traffic control."
	echo
	echo "  -c CAP       set upload limit to CAP"
	echo "  -i INTERFACE apply shaping to INTERFACE"

	exit 1
}


while getopts hc:i: name
do
	case $name in
		c)   cap=$OPTARG ;;
		i)   iface=$OPTARG ;;
		h|?) usage ;;
	esac
done

shift $(($OPTIND - 1))

case $1 in
	start)   start ;;
	stop)    stop ;;
	restart) stop && start ;;
	status)  status ;;
	*)       usage ;;
esac
