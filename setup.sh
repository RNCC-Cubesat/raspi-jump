#!/bin/bash

# I need to be run with root in order to work

# modify dhcpcd config to use both ethernet and wifi and set the ethernet to a static ip of 10.0.2.1 (in the same subnet as 10.0.2.20/24, which is what the KubOS for beaglebone black distribution is hardcoded to)
cat <<EOF >> /etc/dhcpcd.conf
# the lines below were Added by RNCC setup.sh script
interface eth0
static ip_address=10.0.2.1/24

interface wlan0
EOF

echo "Setup complete. Please reboot your raspberry pi by running the command \"sudo reboot\""