#!/bin/bash

cd /home/pi/cameracontrol/IPCamera/wifibroadcast-master_original/

NICS_LIST=`ls /sys/class/net/ | nice grep -v eth0 | nice grep -v lo | nice grep -v usb | nice grep -v intwifi | nice grep -v wlan | nice grep -v relay | nice grep -v wifihotspot`

while true
do
        echo "strt Audio transfer at channel 67 \n"
        ./tx -m 2 -u 5051 -p 67 $NICS_LIST

        NICS_LIST=`ls /sys/class/net/ | nice grep -v eth0 | nice grep -v lo | nice grep -v usb | nice grep -v intwifi | nice grep -v wlan | nice grep -v relay | nice grep -v wifihotspot`
        echo " Restating Audio Transfer with:  $NICS_LIST \n"
        sleep 4
done
