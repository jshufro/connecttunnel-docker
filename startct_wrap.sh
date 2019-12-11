#!/bin/bash

start_dante() {
	while true
	do
		echo "Starting dante" >> /log
		danted -N 10 >> /log 2>&1 
		echo "Dante exited. Retrying in 2s." >> log
		sleep 2
	done
}

mknod /dev/net/tun c 10 200
start_dante &
DANTE_MONITOR=$!
startct --mode console "$@"

# polite shutdown
kill $DANTE_MONITOR
