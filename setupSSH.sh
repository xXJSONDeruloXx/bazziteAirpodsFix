#!/bin/bash

# Script to enable and configure SSH on Bazzite

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root (e.g., sudo ./setup-ssh-on-bazzite.sh)"
  exit 1
fi

echo "Installing openssh-server..."
sudo dnf install -y openssh-server

echo "Enabling SSH service at boot..."
sudo systemctl enable sshd

echo "Starting SSH service..."
sudo systemctl start sshd

echo "Configuring firewall to allow SSH..."
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload

echo "Verifying SSH service status..."
sudo systemctl status sshd

echo "Setup complete! SSH is now enabled and ready for connections."
echo "Test it by running: ssh <your-username>@<IP_ADDRESS>"