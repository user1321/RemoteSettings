#!/bin/bash

cd /home/pi/cameracontrol/IPCamera/wifibroadcast-master_original/

NICS_LIST=`ls /sys/class/net/ | nice grep -v eth0 | nice grep -v lo | nice grep -v usb | nice grep -v intwifi | nice grep -v wlan | nice grep -v relay | nice grep -v wifihotspot`


while ! [ -e /tmp/IsTerminateRemoteSettingsPath.txt ]
do
	echo "start tx -m 10 -u 9292 -p 91 $NICS_LIST \n"
	./tx -m 10 -u 9292 -p 91 $NICS_LIST

	NICS_LIST=`ls /sys/class/net/ | nice grep -v eth0 | nice grep -v lo | nice grep -v usb | nice grep -v intwifi | nice grep -v wlan | nice grep -v relay | nice grep -v wifihotspot`
        echo "tx -m 10 -u 9292 -p 91. Restating with:  $NICS_LIST \n"
        sleep 2
done

