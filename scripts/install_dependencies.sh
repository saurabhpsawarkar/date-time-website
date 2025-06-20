#!/bin/bash
set -e
set -x

# Install NVM (Node Version Manager) from scratch
export NVM_DIR="/home/ec2-user/.nvm"
rm -rf "$NVM_DIR"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Load NVM
source "$NVM_DIR/nvm.sh"

# Install Node.js and use it
nvm install 18
nvm use 18

# Set default for future shells
nvm alias default 18

# Go to app directory
cd /home/ec2-user/app

# Initialize and install dependencies
[ ! -f package.json ] && npm init -y
npm install

# Optional: install and use PM2 for long-term process management
npm install -g pm2
pm2 start app.js --name my-app
pm2 save
pm2 startup | tail -n 1 | bash
