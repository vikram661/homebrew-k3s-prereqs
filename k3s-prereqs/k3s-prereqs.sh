#!/bin/bash
set -e

echo "Installing K3s prerequisites..."

# Ensure Homebrew is available in non-interactive shells
export PATH="/opt/homebrew/bin:$PATH"

# Debugging the brew path
echo "Using brew from: $(which brew)"

# Install yq
echo "Installing yq..."
/opt/homebrew/bin/brew install yq

# Tap and install Vagrant
echo "Tapping HashiCorp and installing Vagrant..."
/opt/homebrew/bin/brew tap hashicorp/tap
/opt/homebrew/bin/brew install hashicorp/tap/hashicorp-vagrant

# Install Vagrant plugin
echo "Installing Vagrant HostManager plugin..."
vagrant plugin install vagrant-hostmanager

# Assuming you want to extract the tarball that contains this script
echo "Extracting the tarball..."
tar -xvzf /path/to/your/k3s-prereqs.tar.gz -C /desired/destination/directory/

echo "All prerequisites installed successfully!"
