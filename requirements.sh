#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

echo "Updating package lists and installing required tools..."

# Update package lists
sudo apt update -y

# Install iproute2 to manage network interfaces
sudo apt install -y iproute2

# Install bridge-utils if you want to use brctl (optional)
sudo apt install -y bridge-utils

# Install Wireshark
sudo apt install -y wireshark

# Ask if the user wants to allow non-root users to run Wireshark
echo "Do you want to allow non-root users to run Wireshark? (y/n)"
read answer
if [ "$answer" = "y" ]; then
  sudo dpkg-reconfigure wireshark-common
  sudo usermod -aG wireshark $USER
  echo "Please log out and log back in for the changes to take effect."
fi

echo "All required tools have been installed."
