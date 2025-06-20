#!/bin/bash
set -e
set -x

# Install Node.js and npm explicitly
curl -fsSL https://rpm.nodesource.com/setup_18.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo yum install -y nodejs

# Reload shell to ensure npm is in PATH
source ~/.bashrc || true
source ~/.profile || true

# Confirm installation
which node
which npm
node -v
npm -v

# Proceed only if npm is available
if command -v npm >/dev/null 2>&1; then
    mkdir -p /home/ec2-user/app
    cd /home/ec2-user/app
    [ ! -f package.json ] && npm init -y
    npm install express
else
    echo "❌ npm still not found. Aborting."
    exit 1
fi
