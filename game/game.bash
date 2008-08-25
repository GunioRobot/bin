#!/bin/bash

killall -STOP conky
(sleep 2 && ${1})
killall -CONT conky
