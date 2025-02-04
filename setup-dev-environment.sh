#!/bin/bash

# This script installs Neovim and Node.js on a fresh Ubuntu 20.04 LTS machine.
# chmod +x install_nvim_node.sh
# ./install_nvim_node.sh

# Exit on error
set -e

# Update package list
echo "Updating package list..."
sudo apt update -y

# Install dependencies
echo "Installing required dependencies..."
sudo apt install -y curl git unzip build-essential

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
