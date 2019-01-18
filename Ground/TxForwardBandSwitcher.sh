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

if [ "$PrimaryCardMAC" == "0" ]; then
	echo "PrimaryCardMAC must be configured \n"		
else
	while true
	do
		echo "start wfb_tx -u 4321 -t 2 -p 57 -B 20 -M 0 $PrimaryCardMAC  (BandSwitcher uplink)"

    		if [ "$EncryptionOrRange" == "Range" ]; then
			./wfb_tx -k 1 -n 1 -u 4321 -t 2 -p 42 -B 20 -M 0 $PrimaryCardMAC
		else
			echo "EncryptionOrRange must be set to Range to work with BandSwitcher\n"
    		fi
		sleep 2
	done		
fi



