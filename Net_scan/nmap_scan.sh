#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Ensure Nmap is installed
if ! command -v nmap &> /dev/null
then
    echo "Nmap could not be found, please install it first."
    exit
fi

# Prompt user for target IP or domain
echo "Enter the target IP address or domain:"
read target

# Ask the user for the type of scan
echo "Select the type of scan to perform:"
echo "1. Ping scan (host discovery)"
echo "2. Full port scan"
echo "3. Service version detection"
echo "4. OS detection"
echo "5. Run all scans (comprehensive)"

read scan_type

# Execute the selected Nmap scan
case $scan_type in
  1)
    echo "Performing a ping scan on $target..."
    nmap -sn $target
    ;;
  2)
    echo "Performing a full port scan on $target..."
    nmap -p- $target
    ;;
  3)
    echo "Performing service version detection on $target..."
    nmap -sV $target
    ;;
  4)
    echo "Performing OS detection on $target..."
    nmap -O $target
    ;;
  5)
    echo "Running a comprehensive scan on $target..."
    nmap -A $target
    ;;
  *)
    echo "Invalid option. Exiting."
    exit
    ;;
esac

echo "Scan complete."
