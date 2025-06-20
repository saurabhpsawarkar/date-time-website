#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Log commands as they are executed
set -x

# Install Node.js (v18)
curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Create app directory if it doesn't exist
mkdir -p /home/ec2-user/app
cd /home/ec2-user/app

# Initialize package.json if not already present
[ ! -f package.json ] && npm init -y

# Install Express
npm install express
