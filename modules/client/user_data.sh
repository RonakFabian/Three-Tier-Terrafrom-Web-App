#!/bin/bash
sudo apt update -y
sudo apt install -y nodejs npm nginx git

# Remove default Nginx config and prepare directory
sudo rm -rf /var/www/html
sudo mkdir -p /var/www/html

# Clone and deploy React app (Replace with your repo)
cd /var/www/html
git clone https://github.com/your-repo/react-app.git .
npm install
npm run build

# Serve React app with Nginx
sudo cp -r build/* /var/www/html/
sudo systemctl restart nginx
