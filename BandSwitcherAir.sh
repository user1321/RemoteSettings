#!/bin/bash

/home/pi/RemoteSettings/Air/TxBandSwitcher.sh &
sleep 0.2
/home/pi/RemoteSettings/Air/RxBandSwitcher.sh &
sleep 0.2
python3.5 /home/pi/RemoteSettings/BandSwitchAir.py &
