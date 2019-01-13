#!/bin/bash

/home/pi/RemoteSettings/Ground/TxForwardFromAndroid.sh  &
sleep 1
/home/pi/RemoteSettings/Ground/RxFrowardToAndroid.sh &
sleep 0.5
/home/pi/RemoteSettings/Ground/TxForwardJoystick.sh &
sleep 0.5
/home/pi/RemoteSettings/Ground/TxForwardBandSwitcher.sh &
sleep 0.5
/home/pi/RemoteSettings/Ground/RxForwardToBandSwitcher.sh &
sleep 0.5
python3.5 /home/pi/RemoteSettings/BandSwitch.py -PrimaryCardMAC a0f3c12c1e23 -SlaveCardMAC 00156d826529
