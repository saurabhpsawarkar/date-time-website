#!/bin/bash
set -e
set -x

# Install Node.js
curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Use full path to npm
NPM_BIN=$(which npm)

if [ -x "$NPM_BIN" ]; then
    mkdir -p /home/ec2-user/app
    cd /home/ec2-user/app
    [ ! -f package.json ] && "$NPM_BIN" init -y
    "$NPM_BIN" install express
else
    echo "❌ npm not found even after installation."
    exit 1
fi
