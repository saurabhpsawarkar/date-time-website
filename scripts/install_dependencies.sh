#!/bin/bash
set -e
set -x

# Unset NVM_DIR to avoid premature reference
unset NVM_DIR

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Load nvm into current shell
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

# Install Node.js (includes npm)
nvm install 18
nvm use 18

# Confirm installation
node -v
npm -v

# Set up app
mkdir -p /home/ec2-user/app
cd /home/ec2-user/app
[ ! -f package.json ] && npm init -y
npm install express
