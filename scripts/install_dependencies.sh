#!/bin/bash

set -e  # Exit immediately if any command fails
set -x  # Echo commands for debugging

# Install Node.js
if curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash - && sudo yum install -y nodejs; then
    echo "✅ Node.js installed successfully."

    # Ensure the app directory exists
    mkdir -p /home/ec2-user/app
    cd /home/ec2-user/app

    # Initialize package.json if it doesn't exist
    [ ! -f package.json ] && npm init -y

    # Install Express
    npm install express

else
    echo "❌ Failed to install Node.js. Aborting npm setup."
    exit 1
fi
