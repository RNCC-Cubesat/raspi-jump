#!/bin/bash

# I need to be run with root in order to work

# modify dhcpcd config to use both ethernet and wifi and set the ethernet to a static ip of 10.0.2.1 (in the same subnet as 10.0.2.20/24, which is what the KubOS for beaglebone black distribution is hardcoded to)
cat <<EOF >> /etc/dhcpcd.conf
# the lines below were Added by RNCC setup.sh script
interface eth0
static ip_address=10.42.0.1/24

interface wlan0
EOF

ipaddr=$(ip addr show dev wlan0 | grep "inet " | awk '{ print substr($2, 1, length($2)-3 )}')

echo "Your Raspberry Pi's wireless IP address is " $ipaddr

echo "You will need this to reconnect to your pi, so make sure you remember it or write it down"
echo ""

echo "Setup complete. Please reboot your raspberry pi by running the command \"sudo reboot\""