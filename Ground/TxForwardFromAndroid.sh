#!/bin/bash

#!/bin/bash

if [ -e "/tmp/settings.sh" ]; then
    OK=`bash -n /tmp/settings.sh`
    if [ "$?" == "0" ]; then
        source /tmp/settings.sh
    else
        echo "ERROR: wifobroadcast config file contains syntax error(s)!"
        collect_errorlog
        sleep 365d
    fi else
    echo "ERROR: wifobroadcast config file not found!"
    collect_errorlog
    sleep 365d
fi


cd /home/pi/cameracontrol/IPCamera/wifibroadcast-master_original/

NICS_LIST=`ls /sys/class/net/ | nice grep -v eth0 | nice grep -v lo | nice grep -v usb | nice grep -v intwifi | nice grep -v wlan | nice grep -v relay | nice grep -v wifihotspot`

while true
do
	echo "start tx -u 9090 -p 90 $NICS_LIST  (forward msg from android phone. UDP port 9090.\n"

    	if [ "$EncryptionOrRange" == "Range" ]; then
		./tx -m 10 -u 9090 -t 2 -p 90 $NICS_LIST
    	fi

    	if [ "$EncryptionOrRange" == "Encryption" ]; then
            ./tx -m 10 -u 9090 -t 0 -p 90 $NICS_LIST
    	fi

	NICS_LIST=`ls /sys/class/net/ | nice grep -v eth0 | nice grep -v lo | nice grep -v usb | nice grep -v intwifi | nice grep -v wlan | nice grep -v relay | nice grep -v wifihotspot`
	echo "start tx -u 9090 -p 90 down. Restating with:  $NICS_LIST \n"
	sleep 2
done
