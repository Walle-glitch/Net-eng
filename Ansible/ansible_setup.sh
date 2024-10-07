#!/bin/bash

# Check if the script is being run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root or using sudo." 
   exit 1
fi

echo "Updating the package lists..."
sudo apt update -y

echo "Installing software-properties-common..."
sudo apt install -y software-properties-common

echo "Adding Ansible PPA repository..."
sudo add-apt-repository --yes --update ppa:ansible/ansible

echo "Updating package lists after adding PPA..."
sudo apt update -y

echo "Installing Ansible..."
sudo apt install -y ansible

echo "Ansible installation complete."
ansible --version

echo "Setting up SSH key for Ansible..."
if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    echo "SSH key not found, generating one..."
    ssh-keygen -t rsa -b 4096 -N "" -f $HOME/.ssh/id_rsa
    echo "SSH key generated."
else
    echo "SSH key already exists. Skipping generation."
fi

echo "Setup is complete. You can now configure your inventory and start using Ansible."
