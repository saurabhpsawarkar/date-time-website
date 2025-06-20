#!/bin/bash

# Install Node.js
curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Initialize and install express
cd /home/ec2-user/app
npm init -y
npm install express
