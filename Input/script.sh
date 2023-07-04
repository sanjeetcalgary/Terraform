#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
echo "<html><body><div>Welcome to Self-Learning ! $(lshw -html)</div></body></html>" > /var/www/html/index.html

