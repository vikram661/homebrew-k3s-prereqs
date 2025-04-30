#!/bin/bash

# Install yq (Formula)
echo "Installing yq (formula)..."
brew install yq

# Install Vagrant (Cask)
echo "Tapping HashiCorp and installing Vagrant (cask)..."
brew tap hashicorp/tap
brew install --cask hashicorp/tap/vagrant

# Install VirtualBox (Cask)
echo "Installing VirtualBox (cask)..."
brew install --cask virtualbox

# Any other prerequisites you need to install can go here

echo "All prerequisites installed successfully!"
