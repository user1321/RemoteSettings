#!/bin/bash

cd /home/pi/cameracontrol/IPCamera/wifibroadcast-master_original/

NICS_LIST=`ls /sys/class/net/ | nice grep -v eth0 | nice grep -v lo | nice grep -v usb | nice grep -v intwifi | nice grep -v wlan | nice grep -v relay | nice grep -v wifihotspot`

while true
do
	echo "/rx -c 127.0.0.1 -u 5115 -p 91 $NICS_LIST  (forward msg from android phone. UDP port 5115.\n"
	./rx -c 127.0.0.1 -u 5115 -p 91 $NICS_LIST


	NICS_LIST=`ls /sys/class/net/ | nice grep -v eth0 | nice grep -v lo | nice grep -v usb | nice grep -v intwifi | nice grep -v wlan | nice grep -v relay | nice grep -v wifihotspot`
	echo "/rx -c 127.0.0.1 -u 5115 -p 91 down. Restating with:  $NICS_LIST \n"
	sleep 2
done
