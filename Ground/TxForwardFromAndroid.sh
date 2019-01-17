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


cd /home/pi/cameracontrol/IPCamera/svpcom_wifibroadcast/

while true
do
	echo "start wfb_tx -u 9090 -p 90 $NICS_LIST  (forward msg from android phone. UDP port 9090.\n"

    	if [ "$EncryptionOrRange" == "Range" ]; then
		./wfb_tx -u 9090 -t 2 -p 90 -B 20 -M 0 $NICS
    	fi
	
	
        if [ "$EncryptionOrRange" == "RangeAth9k" ]; then
		./wfb_tx -u 9090 -t 2 -p 90 -B 20 -M 0 $PrimaryCardMAC
    	fi 
	
    	if [ "$EncryptionOrRange" == "Encryption" ]; then
            ./wfb_tx -u 9090 -t 0 -p 90 -B 20 -M 0 $PrimaryCardMAC
    	fi

	echo "start wfb_tx -u 9090 -p 90 down. Restating with:  $PrimaryCardMAC \n"
	sleep 2
done
