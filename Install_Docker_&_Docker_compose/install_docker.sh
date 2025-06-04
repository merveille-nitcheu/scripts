#!/bin/bash

# Exit on error
set -e

# Check if script is run as root/sudo
if [ "$EUID" -ne 0 ]; then 
    echo "This script must be run as root. Requesting sudo privileges..."
    exec sudo "$0" "$@"
    exit
fi

echo "Updating the system..."
apt update && apt upgrade -y

echo "Installing required dependencies..."
apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    apt-transport-https \
    software-properties-common

echo "Adding Docker's official GPG key..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo "Adding Docker repository to APT sources..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  > /etc/apt/sources.list.d/docker.list

echo "Refreshing APT package index..."
apt update

echo "Installing Docker Engine, CLI and containerd..."
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Adding current user to the 'docker' group..."
usermod -aG docker "$SUDO_USER"

echo "Verifying Docker installation..."
docker --version

echo "Verifying Docker Compose (v2 plugin)..."
docker compose version

echo "Docker and Docker Compose have been successfully installed!"

echo "You may need to log out and log back in for the changes to take effect."
