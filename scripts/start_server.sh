#!/bin/bash
cd /home/ec2-user/app
node app.js > app.log 2>&1 &
