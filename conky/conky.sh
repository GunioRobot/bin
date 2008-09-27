#!/bin/bash

conky=`which conky`

case "$1" in
    stop)
        killall conky
    ;;
    start)
        conky -dc ~/.conky/conkyrc &
        #sleep 2
        #conky -dc ~/.conky/timerc &
    ;;
    restart)
        $0 stop
        $0 start
    ;;
    *)
        echo "USAGE: $0 stop|start|restart"
esac

