#!/bin/bash

# how to run! 
# chmod +x bridge_wireshark.sh
# sudo ./bridge_wireshark.sh

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# List all network interfaces
echo "Available network interfaces:"
ip link show | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2}' | sed 's/ //g'

# Prompt user to select two interfaces
echo "Enter the first interface to bridge:"
read iface1
echo "Enter the second interface to bridge:"
read iface2

# Create the bridge interface
echo "Creating the bridge between $iface1 and $iface2..."
ip link add name br0 type bridge
ip link set $iface1 master br0
ip link set $iface2 master br0
ip link set br0 up
ip link set $iface1 up
ip link set $iface2 up

echo "Bridge created successfully. Starting Wireshark..."

# Start Wireshark
sudo wireshark &

# Wait for Wireshark to close
wait $!

echo "Wireshark closed. Removing the bridge..."

# Bring down the interfaces and remove the bridge
ip link set $iface1 nomaster
ip link set $iface2 nomaster
ip link delete br0 type bridge

echo "Bridge removed. Exiting."
