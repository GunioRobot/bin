#!/bin/bash

killall -STOP conky
sleep 2
"${1}"
sleep 3
killall -CONT conky
