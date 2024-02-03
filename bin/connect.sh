#!/bin/bash

#this is a script to power up the wifi adaptor and configure it
DO=${1}
#first we turn on the wifi or ethernet
case $DO in
	"1") 
		sudo ip link set enp6s0 up
		echo "Connecting Through Ethernet"
		#then we ask for an ip and all the good stuff
		sudo dhcpcd
	;;
	"2")
		sudo ip link set wlp5s0b1 up 
		#Then we add the SSID and pass to a configuration file automatically made by the drivers 
		echo "Connecting to ${2} using config file ${4}"
		echo 

		sudo wpa_passphrase ${2} ${3} > /etc/wpa_supplicant/script${4}.conf 
		#then we connect to a network using said configuration file!
		sudo wpa_supplicant -B -i wlp5s0b1 -c /etc/wpa_supplicant/script${4}.conf 
		#then we ask for an ip and all the good stuff
		sudo dhcpcd
		;;
	*) echo "1 - Power up ethernet and connect
2 - Power up Wifi card and connect
	-Must state an SSID , password and Config Number!"
	;;
esac 

