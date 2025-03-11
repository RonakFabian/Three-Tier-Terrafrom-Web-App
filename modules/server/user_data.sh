#!/bin/bash
sudo apt update -y
sudo apt install -y nodejs npm
mkdir -p /home/ubuntu/app
cd /home/ubuntu/app
npm init -y
npm install express
cat <<EOT > server.js
const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('Hello from private EC2'));
app.listen(3000, () => console.log('Server running on port 3000'));
EOT
node server.js