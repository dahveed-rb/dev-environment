#!/bin/bash

# This script installs Neovim and Node.js on a fresh Ubuntu 20.04 LTS machine.
# wget https://raw.githubusercontent.com/dahveed-rb/dev-environment/main/setup-dev-environment.sh
# chmod +x setup-dev-environment.sh
# ./setup-dev-environment.sh

# Update package list
echo "Updating package list..."
sudo yum update -y

# Install dependencies
echo "Installing required dependencies..."
sudo yum install -y curl git unzip tar gcc-c++ make shadow-utils

# Install Neovim
echo "Installing Neovim..."
NVIM_VERSION="stable"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /usr/local -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
echo "Neovim installed successfully!"

# Install NVM (Node Version Manager)
echo "Installing NVM..."
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash

# Load NVM environment variables (for current session)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node.js via NVM
echo "Installing Node.js..."
nvm install --lts
nvm use --lts
nvm alias default stable

# Verify installations
echo "Verifying installations..."
nvim --version
node -v
npm -v

echo "Neovim and Node.js have been successfully installed!"