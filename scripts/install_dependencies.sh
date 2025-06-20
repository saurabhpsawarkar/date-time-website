#!/bin/bash
set -e
set -x

# Install NVM without pre-setting NVM_DIR
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Load NVM into current shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install and use Node.js
nvm install 18
nvm use 18
nvm alias default 18

# Go to app directory
cd /home/ec2-user/app

# Install dependencies
[ ! -f package.json ] && npm init -y
npm install

# Optional: Start app with PM2
npm install -g pm2
pm2 start app.js --name my-app
pm2 save
pm2 startup | tail -n 1 | bash
